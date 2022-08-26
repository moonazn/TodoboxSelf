//
//  TaskEditorViewController.swift
//  TodoboxSelf
//
//  Created by 송지연 on 2022/07/28.
//

import UIKit

//커밋연습with신승재씨

class TaskEditorViewController: UIViewController {
    
    @IBOutlet var titleInput: UITextField!
    @IBOutlet var textView: UITextView!
    
    var didAddHandler: ((Task) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textView.layer.cornerRadius = 5
        self.textView.layer.borderColor = UIColor.lightGray.cgColor
        self.textView.layer.borderWidth = 1 / UIScreen.main.scale
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.titleInput.becomeFirstResponder()
    }
    
    @IBAction func cancelButtonDidTap(_ sender: Any) {
        self.titleInput.resignFirstResponder()
        
        if self.titleInput.text?.isEmpty == true {
            self.dismiss(animated: true, completion: nil)
            return
        }
        
        let yes = UIAlertAction(title: "작성 취소", style: .destructive) { _ in
            self.dismiss(animated: true, completion: nil)
        }
        
        let no = UIAlertAction(title: "계속 작성", style: .default) { _ in
            self.titleInput.becomeFirstResponder()
        }
        
        let alertController = UIAlertController(
            title: "앗!",
            message: "취소하면 작성중인 내용이 손실됩니다. \n취소하시겠어요?",
            preferredStyle: .alert
        )
        
        alertController.addAction(yes)
        alertController.addAction(no)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func doneButtonDidTap(_ sender: Any) {
        guard let title = self.titleInput.text, !title.isEmpty else {
            self.shakeTitleInput()
            return
        }
        
        self.titleInput.resignFirstResponder()
        
        
        let newTask = Task(title: title, note: self.textView.text)
        self.didAddHandler?(newTask)
        self.dismiss(animated: true, completion: nil)
    }

    
    func shakeTitleInput() {
        UIView.animate(withDuration: 0.05, animations: { self.titleInput.frame.origin.x -= 5 }, completion: { _ in
            UIView.animate(withDuration: 0.05, animations: { self.titleInput.frame.origin.x += 10 }, completion: { _ in
                    UIView.animate(withDuration: 0.05, animations: { self.titleInput.frame.origin.x -= 10 }, completion: { _ in
                            UIView.animate(withDuration: 0.05, animations: { self.titleInput.frame.origin.x += 10 }, completion: { _ in
                                    UIView.animate(withDuration: 0.05, animations: { self.titleInput.frame.origin.x -= 5 })
                                })
                        })
                })
            })
    }

}
