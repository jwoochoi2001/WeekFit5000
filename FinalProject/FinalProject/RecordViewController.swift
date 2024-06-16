import UIKit

class RecordViewController: UIViewController, InputViewControllerDelegate {
    
    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var totalCaloriesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        // 뒤로가기 버튼 추가
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "뒤로가기", style: .plain, target: self, action: #selector(backButtonTapped))
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func updateUI() {
        let savedCalories = UserDefaults.standard.double(forKey: "calories")
        totalCaloriesLabel.text = "\(Int(savedCalories))"
        recordLabel.text = "\(Int(savedCalories))"
    }
    
    @IBAction func deleteRecords(_ sender: UIButton) {
        let alert = UIAlertController(title: "경고", message: "정말로 모든 기록을 삭제하시겠습니까?", preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: "삭제", style: .destructive) { [weak self] _ in
            // UserDefaults에서 삭제하지 않고, recordLabel만 0으로 초기화
            self?.updateRecordLabel(with: 0.0)
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func updateRecordLabel(with calories: Double) {
        recordLabel.text = "\(Int(calories)) "
    }
    
    func didInputCalories(_ calories: Double, to firstViewController: Bool, to recordViewController: Bool) {
        // 새로 입력된 칼로리를 UserDefaults에 저장
        UserDefaults.standard.set(calories, forKey: "calories")
        UserDefaults.standard.synchronize()
        
        // 라벨에 새로 입력된 칼로리 값을 표시
        updateUI()
    }
    
    @IBAction func finishButtonTapped(_ sender: UIButton) {
        let savedCalories = UserDefaults.standard.double(forKey: "calories")
        let alert: UIAlertController
        
        if savedCalories >= 5000 {
            alert = UIAlertController(title: "축하합니다!", message: "당신의 노력이 성공을 만들었어요!", preferredStyle: .alert)
            UserDefaults.standard.set(0.0, forKey: "calories")
        } else {
            alert = UIAlertController(title: "아직이에요!", message: "조금 더 힘을 내세요", preferredStyle: .alert)
        }
        
        let okAction = UIAlertAction(title: "확인", style: .default) { [weak self] _ in
            self?.updateUI()
        }
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
