
import UIKit
import CoreLocation

class ResultViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!

    var weatherManager = WeatherManager()
    var cityName: String?
    let locationManager = CLLocationManager()
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
         weatherManager.delegate = self
        
        if let city = self.cityName{
           weatherManager.fetchWeather(cityName: city)
        }else{
            locationManager.delegate = self
            locationManager.requestWhenInUseAuthorization()
            locationManager.requestLocation()
        }
  
    }
}

//MARK: - WeatherManagerDelegate
extension ResultViewController:WeatherManagerDelegate{
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperaureString
            self.cityLabel.text = weather.cityName
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
        }
        
    }
    
    func didFailWithError(error: Error) {
        print(error.localizedDescription)
    }
}
//MARK: - CLLocationManagerDelegate
extension ResultViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(lat: lat, lon: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
