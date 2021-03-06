//
////メモ追加
//
//import UIKit
//
//final class AddMemoViewController : UIViewController, UITextViewDelegate {
//    
//    
//    @IBOutlet private weak var memoDate: UILabel!
//    @IBOutlet private weak var memoCategory: UILabel!
//    @IBOutlet private weak var memoTitle: UITextField!
//    @IBOutlet private weak var memoText: UITextView!
//    
//    private var operationMemo: OperationMemo!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        operationMemo = OperationMemo()
//        getDate()
//        settingLayout()
//        
//        if #available(iOS 13.0, *) {
//            if (UITraitCollection.current.userInterfaceStyle == .dark) {
//                settingDarkMode()
//            }
//        } else {
//            // Fallback on earlier versions
//        }
//        
//        self.navigationController?.setNavigationBarHidden(true, animated: true)
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        
//        self.navigationController?.setNavigationBarHidden(false, animated: true)
//    }
//}
//
//
//extension AddMemoViewController {
//    
//    
//    override func touchesBegan(_ touches: Set<UITouch>,with event: UIEvent?){
//        
//        //keyboardの外を押したら、キーボードを閉じる処理
//        if (memoText.isFirstResponder) {
//            memoText.resignFirstResponder()
//        }
//        
//        if touchedLabel(touches: touches,view: memoCategory){
//            
//            let storyboard: UIStoryboard = UIStoryboard(name: "AddMemoCategory", bundle: nil)
//            let nextVC = storyboard.instantiateViewController(withIdentifier: "AddMemoChoseCategory") as! AddMemoCategoryViewController
//            
//            nextVC.delegate = self
//            self.present(nextVC, animated: true, completion: nil)
//            
//            return
//        }
//    }
//    
//    @IBAction func saveMemo(_ sender: Any) {
//        
//        guard memoTitle.text != nil && memoText.text != nil && memoDate.text != nil else { return }
//        
//        let inputTitle = memoTitle.text!.trimmingCharacters(in: .whitespaces)
//        let inputText = memoText.text!.trimmingCharacters(in: .whitespaces)
//        
//        guard !inputText.isEmpty && !inputTitle.isEmpty else { return }
//        
//        operationMemo.add(memo: MemoData(category: memoCategory.text!, date: memoDate.text!, title: inputTitle, text: inputText))
//        
//        self.dismiss(animated: true, completion: nil)
//    }
//    
//    @IBAction func cancelEdit(_ sender: Any) {
//        
//        self.dismiss(animated: true, completion: nil)
//    }
//    
//    private func settingDarkMode() {
//        
//        memoCategory.backgroundColor = .black
//        memoDate.backgroundColor = .black
//        memoTitle.backgroundColor = .black
//    }
//    
//    private func settingLayout() {
//        
//        memoTitle.placeholder = "タイトルを入力"
//        memoCategory.text = "カテゴリー未指定"
//    }
//    
//    internal func getDate() {
//        
//        let now = Date()
//        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale(identifier: "en_JP")
//        dateFormatter.dateFormat = "yyyy/MM/dd(EEE)"
//        dateFormatter.string(from: now)
//        memoDate.text = dateFormatter.string(from: now)
//    }
//    
//    internal func touchedLabel(touches: Set<UITouch>, view:UILabel) -> Bool {
//        
//        //全指のタッチについて処理
//        for touch: AnyObject in touches {
//            
//            let t: UITouch = touch as! UITouch
//            
//            if t.view?.tag == view.tag {
//                
//                return true
//            } else {
//                
//                return false
//            }
//        }
//        return false
//    }
//}
//
//
//extension AddMemoViewController: AddMemoCategoryViewControllerDelegate {
//    
//    
//    internal func getCategoryName(category: String) {
//        memoCategory.text = category
//    }
//}
