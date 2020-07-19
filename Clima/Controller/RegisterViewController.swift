
import UIKit

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkPasswordTextField: UITextField!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    
    
    
    @IBAction func loginPage(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToLoginFromRegister", sender: self)
    }
    
    
    
    
    @IBAction func registerBtn(_ sender: UIButton) {
        
        if nameTextField.text?.isEmpty ?? true || passwordTextField.text?.isEmpty ?? true || checkPasswordTextField.text?.isEmpty ?? true {
            
            nameTextField.attributedPlaceholder = NSAttributedString(string: "Enter your name",
                                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            
            passwordTextField.attributedPlaceholder = NSAttributedString(string: "Enter your Password",
                                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            
            checkPasswordTextField.attributedPlaceholder = NSAttributedString(string: "Enter your Password",
                                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            
        } else {
            
            if passwordTextField.text != checkPasswordTextField.text {
                
                self.showToast(message: "The password does not match", font: .systemFont(ofSize: 20.0))

            }else {
                
                UserDefaults.standard.set(nameTextField.text, forKey: "name")
                UserDefaults.standard.set(passwordTextField.text, forKey: "password")
                
                self.performSegue(withIdentifier: "goToWeaterFromRegister", sender: self)
            }
            
        }
     }
    
}





extension UIViewController {

func showToast(message : String, font: UIFont) {

    let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 150, y: self.view.frame.size.height-400, width: 290, height: 60))
    toastLabel.backgroundColor = UIColor.red.withAlphaComponent(0.9)
    toastLabel.textColor = UIColor.white
    toastLabel.font = font
    toastLabel.textAlignment = .center;
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 25;
    toastLabel.clipsToBounds  =  true
    self.view.addSubview(toastLabel)
    UIView.animate(withDuration: 5.0, delay: 0.8, options: .curveEaseOut, animations: {
         toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
} }

