import UIKit

protocol InputViewControllerDelegate: AnyObject {
    func didInputCalories(_ calories: Double, to firstViewController: Bool, to recordViewController: Bool)
}

class InputViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    weak var delegate: InputViewControllerDelegate?
    
    @IBOutlet weak var exercisePicker: UIPickerView!
    @IBOutlet weak var exerciseImageView: UIImageView!
    @IBOutlet weak var durationTextField: UITextField!

    let exercises = ["걷기", "조깅", "달리기", "자전거 타기", "수영", "에어로빅", "줄넘기", "등산", "요가", "직접 칼로리 입력"]
    let exerciseImages = ["walking.jpg", "jogging.jpg", "running.jpg", "cycling.jpg", "swimming.jpg", "aerobics.jpg", "jump_rope.jpg", "hiking.jpg", "yoga.jpg", "show.jpg"]
    var currentExerciseIndex = 0
    
    var weight: Double = 0.0  // 현재 체중 변수 추가
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exercisePicker.delegate = self
        exercisePicker.dataSource = self
        updateExerciseImage()

        // 화면 탭 제스처 인식기 추가
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    // 키보드 숨기기 메서드
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return exercises.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return exercises[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentExerciseIndex = row
        updateExerciseImage()
    }

    func updateExerciseImage() {
        let imageName = exerciseImages[currentExerciseIndex]
        exerciseImageView.image = UIImage(named: imageName)
    }

    @IBAction func inputButtonTapped(_ sender: UIButton) {
        guard let durationText = durationTextField.text, let duration = Double(durationText) else {
            showAlert(message: "올바르지 않은 숫자입니다.")
            return
        }
        
        let caloriesBurned = calculateCalories(for: currentExerciseIndex, duration: duration)
        
        // FirstViewController와 RecordViewController에 결과값 보내기
        if let delegate = delegate {
            delegate.didInputCalories(caloriesBurned, to: true, to: true)
        }
        
        // Show congratulatory message
        showCongratulatoryDialog()
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    func showCongratulatoryDialog() {
        let alert = UIAlertController(title: nil, message: "고생 많았어요!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "완료", style: .default, handler: { [weak self] _ in
            self?.navigateBack()
        }))
        present(alert, animated: true, completion: nil)
    }

    func navigateBack() {
        // Check if we have a navigationController and pop to root
        if let navController = self.navigationController {
            navController.popToRootViewController(animated: true)
        } else {
            // If there's no navigation controller, dismiss the current view controller
            self.dismiss(animated: true, completion: nil)
        }
    }

    func calculateCalories(for exerciseIndex: Int, duration: Double) -> Double {
        switch exerciseIndex {
        case 0: // 걷기
            return (0.021 * weight) + (0.0045 * duration)
        case 1: // 조깅
            return (0.13 * weight) + (0.1 * duration)
        case 2: // 달리기
            return (0.21 * weight) + (0.1 * duration)
        case 3: // 자전거 타기
            return (0.9 * weight) * (duration / 60)
        case 4: // 수영
            return (0.42 * weight) * (duration / 60)
        case 5: // 에어로빅
            return (0.33 * weight) * (duration / 60)
        case 6: // 줄넘기
            return (0.18 * weight) + (7.2 * duration)
        case 7: // 등산
            return (0.07 * weight) * (duration / 60)
        case 8: // 요가
            return (0.17 * weight) + (0.03 * duration)
        case 9: // 입력값 그대로 반환
            return duration
        default:
            return 0.0
        }
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
