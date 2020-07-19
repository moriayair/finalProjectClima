
import UIKit

class StartViewController: UIViewController {


    
    @IBAction func loginBtn(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToLogin", sender: self)
    }
    
    
    @IBAction func registerBtn(_ sender: UIButton) {
         self.performSegue(withIdentifier: "goToRegister", sender: self)
    }
    
    
    
   

}
