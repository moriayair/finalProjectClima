
import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextFild: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func loginBtn(_ sender: UIButton) {
        
        if nameTextField.text?.isEmpty ?? true || passwordTextFild.text?.isEmpty ?? true{
            nameTextField.attributedPlaceholder = NSAttributedString(string: "Enter your name",
                                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            
            passwordTextFild.attributedPlaceholder = NSAttributedString(string: "Enter your Password",
                                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            
        }else{
            
            let name = UserDefaults.standard.string(forKey: "name")
            let password = UserDefaults.standard.string(forKey: "password")
            
            if nameTextField.text == name && passwordTextFild.text == password{
                self.performSegue(withIdentifier: "goToWeatherFromLogin", sender: self)
                passwordTextFild.endEditing(true)
            }else{
                self.showToastLogin(message: "The Password and the Name does not Exists", font: .systemFont(ofSize: 16.0))

            }

            
            

        }
        
    }
    
    @IBAction func registerPage(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToRegisterFromLogin", sender: self)
    }
}


extension UIViewController {

func showToastLogin(message : String, font: UIFont) {

    let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 180, y: self.view.frame.size.height-400, width: 350, height: 60))
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

