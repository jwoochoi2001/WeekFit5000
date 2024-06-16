import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var calorie: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UserDefaults에서 저장된 칼로리 값을 불러와서 라벨에 표시
        let savedCalories = UserDefaults.standard.double(forKey: "calories")
        calorie.text = "\(Int(savedCalories))"
    }

    @IBAction func showInputViewController(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let inputVC = storyboard.instantiateViewController(withIdentifier: "InputViewController") as! InputViewController
        inputVC.delegate = self
        
        // 현재 체중 값을 InputViewController에 전달
        if let currentWeight = UserDefaults.standard.object(forKey: "currentWeight") as? Double {
            inputVC.weight = currentWeight
        }
        
        self.present(inputVC, animated: true, completion: nil)
    }

    @IBAction func showUserInfoDialog(_ sender: UIButton) {
        openInputDialog(sender)
    }
    
    @IBAction func resetCalories(_ sender: UIButton) {
        // 라벨만 0 kcal로 초기화
        calorie.text = "0"
    }

    
    @IBAction func showRecordViewController(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let recordVC = storyboard.instantiateViewController(withIdentifier: "RecordViewController") as! RecordViewController
        self.present(recordVC, animated: true, completion: nil)
    }

    @objc func openInputDialog(_ sender: Any) {
        print("openInputDialog called")
        let alertController = UIAlertController(title: "내 정보 입력", message: "\n\n\n", preferredStyle: .alert)  // 메시지 부분에 여백 추가
        
        let genderSegmentedControl = UISegmentedControl(items: ["남자", "여자"])
        genderSegmentedControl.selectedSegmentIndex = 0  // 기본 선택 값 설정 (남자)
        alertController.view.addSubview(genderSegmentedControl)
        genderSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        genderSegmentedControl.topAnchor.constraint(equalTo: alertController.view.topAnchor, constant: 60).isActive = true  // 상단 여백을 늘림
        genderSegmentedControl.centerXAnchor.constraint(equalTo: alertController.view.centerXAnchor).isActive = true
        
        alertController.addTextField { (textField) in
            textField.placeholder = "목표 체중"
            textField.keyboardType = .decimalPad  // 소수점 입력을 포함한 숫자 키패드
        }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "현재 체중"
            textField.keyboardType = .decimalPad  // 소수점 입력을 포함한 숫자 키패드
        }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "나이"
            textField.keyboardType = .numberPad  // 숫자 키패드
        }
        
        let cancelAction = UIAlertAction(title: "뒤로 가기", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let saveAction = UIAlertAction(title: "저장", style: .default) { (_) in
            guard let targetWeightTextField = alertController.textFields?.first else { return }
            guard let currentWeightTextField = alertController.textFields?[1] else { return }
            guard let ageTextField = alertController.textFields?.last else { return }
            
            guard let targetWeight = targetWeightTextField.text, !targetWeight.isEmpty else {
                self.showAlert(message: "목표 체중을 입력하세요.")
                return
            }
            guard let currentWeight = currentWeightTextField.text, !currentWeight.isEmpty else {
                self.showAlert(message: "현재 체중을 입력하세요.")
                return
            }
            guard let age = ageTextField.text, !age.isEmpty else {
                self.showAlert(message: "나이를 입력하세요.")
                return
            }
            
            guard let targetWeightDouble = Double(targetWeight), let currentWeightDouble = Double(currentWeight) else {
                self.showAlert(message: "잘못된 입력입니다. 숫자를 입력하세요.")
                return
            }
            
            let selectedGender = genderSegmentedControl.selectedSegmentIndex == 0 ? "남자" : "여자"
            self.genderLabel.text = selectedGender
            self.ageLabel.text = age
            self.weightLabel.text = currentWeight
            self.targetLabel.text = targetWeight
            
            UserDefaults.standard.set(currentWeightDouble, forKey: "currentWeight")
            UserDefaults.standard.synchronize()
        }
        
        alertController.addAction(saveAction)
        
        alertController.view.subviews.first?.isUserInteractionEnabled = true
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "경고", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}

// InputViewControllerDelegate 구현
extension FirstViewController: InputViewControllerDelegate {
    func didInputCalories(_ calories: Double, to firstViewController: Bool, to recordViewController: Bool) {
        // UserDefaults에서 현재 칼로리 값을 불러옴
        var totalCalories = UserDefaults.standard.double(forKey: "calories")
        
        // 새로 입력된 칼로리를 추가
        totalCalories += calories
        
        // UserDefaults에 업데이트된 칼로리 값을 저장
        UserDefaults.standard.set(totalCalories, forKey: "calories")
        UserDefaults.standard.synchronize()
        
        // 라벨에 업데이트된 칼로리 값을 표시
        calorie.text = "\(Int(totalCalories))"
    }
}
