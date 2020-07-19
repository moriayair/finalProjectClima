

import UIKit


class SearchWeatherViewController: UIViewController {
    
  
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    var cityName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
           let vc = segue.destination as! ResultViewController
            vc.cityName = cityName
        }
    }

}


extension SearchWeatherViewController: UITextFieldDelegate{
    @IBAction func searchPressed(_ sender: UIButton) {
         searchTextField.endEditing(true)
     }
     
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         searchTextField.endEditing(true)
         print(searchTextField.text!)

         return true
     }

     func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
         if textField.text != ""{
             textField.placeholder = "Search"
             return true
         }else{
             textField.placeholder = "Type something"
             return false
         }
     }
     
     func textFieldDidEndEditing(_ textField: UITextField) {
         if searchTextField.text != nil{
             self.cityName = textField.text
              performSegue(withIdentifier: "goToResult", sender: self)
         }
         
         searchTextField.text = ""
     }
}
