//
//  ViewController.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 1/19/21.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, UICollectionViewDataSource {
    
    var locationManager = CLLocationManager()
    let layoutForecast = UICollectionViewFlowLayout()
    var apiWeather = WeatherAPI()
    var maintempInfo = MainTempInfo()
    var contentView = otherWInfo()
    var test1 = ForecastData()
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
    var numberCells = Int()
    var forecastMainTemp = [Int]()
    var forecastDate = [String]()
    var forecastImageString = [String]()
    var forecastImage = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = bgColor
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            
            setUpView()
        }
    }

    func setUpView() {
        layoutForecast.itemSize = CGSize(width: view.frame.width/5, height: 100)
        layoutForecast.scrollDirection = .horizontal
        layoutForecast.minimumLineSpacing = 0
        
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layoutForecast)
        self.collectionView.isScrollEnabled = true
        self.collectionView.backgroundColor = .clear
        self.collectionView.register(ForecastCollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        self.collectionView.dataSource = self

        maintempInfo.searchButton.addTarget(self, action: #selector(displaySearchVC), for: .touchUpInside)
        maintempInfo.settingsButton.addTarget(self, action: #selector(displaySettingsVC), for: .touchUpInside)
        
        view.addConstrainedSubviews(maintempInfo, contentView, collectionView)
        
        NSLayoutConstraint.activate([
                                        
            maintempInfo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            maintempInfo.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3),
            maintempInfo.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            collectionView.topAnchor.constraint(equalTo: maintempInfo.bottomAnchor),
            collectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 100),
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            contentView.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                        
            ])
    }
    
     @objc func testChange() {
        self.maintempInfo.mainTemp.textColor = .green
        print("this is a test to see this")
    }
    
    @objc func displaySettingsVC() {
        present(SettingsViewController(), animated: true, completion: nil)
    }
    
    @objc func displaySearchVC() {
        present(SearchViewController(), animated: true, completion: nil)
    }
    
  //  func forecastWeatherDisplay(forecast: ForecastList) {
  //      for number in forecast.list.count {
  //
  //      }
  //  }
    
    
    func weatherDisplay(weathers: WeatherResponse, cityName: String, stateName: String) {
        let progressNumber = Float(weathers.main.humidity)
        let currentTemp = Int(weathers.main.temp.rounded())
        let lowerTemp = Int(weathers.main.lowTemp.rounded())
        let higherTemp = Int(weathers.main.highTemp.rounded())
        let feelTemp = Int(weathers.main.feels_like.rounded())
        let windInfo = Int(weathers.wind.speed.rounded())
        let sunset = weathers.time.sunset
        let sunsetTime = sunsetSunriseTimeSet(convertTime: Double(sunset))
        let sunrise = weathers.time.sunrise
        let sunriseTime = sunsetSunriseTimeSet(convertTime: Double(sunrise))
        let descrip = "\(weathers.weather[0].description.capitalized)"
        let infoShort = "\(weathers.weather[0].shortDescription)"
        let windDir = windLocation(weathers.wind.degree)
        
        maintempInfo.mainTemp.text = "\(currentTemp)°"
        maintempInfo.infoLabel.text = "\(infoShort)"
        maintempInfo.cityAndState.text = "\(cityName)"
        
        let progNum = progressNumber/100
        UIView.animate(withDuration: 4) {
            self.contentView.humidityBar.setValue(progNum, animated: true)
        }
        self.maintempInfo.lowTemp.text = "\(lowerTemp)°"
        self.maintempInfo.highTemp.text = "\(higherTemp)°"
        self.contentView.windInfo.text = "\(windDir) \(windInfo) mph"
        self.contentView.feelsLike.text = "\(feelTemp)°"
        self.contentView.weatherDescrip.text = "\(descrip) today. Forecast shows a high of \(higherTemp) and low of \(lowerTemp)"
        self.contentView.sunrise.text = "\(sunriseTime)am"
        self.contentView.sunset.text = "\(sunsetTime)pm"
        self.contentView.humidityNumber.text = "\(weathers.main.humidity)%"
        self.test1.main = currentTemp
        self.collectionView.reloadData()
        
    }
    
    @objc func changeBack() {
        print("This is a test to see if it works and i will")
    }
           
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locationValue : CLLocationCoordinate2D = manager.location?.coordinate else {
            return
               }
        let lat = String(locationValue.latitude)
        let longi = String(locationValue.longitude)

        CLGeocoder().reverseGeocodeLocation(locations[0]) { (placemark, error) in
            if error != nil {
                
            }
            else {
                if let place = placemark?[0] {
                    guard let cityname = place.locality, let statename = place.administrativeArea else {
                        return
                    }
            let setImageWeatherIcon:(UIImage) -> Void = { iconWeatherImage in
                DispatchQueue.main.async {
                    self.maintempInfo.weatherImg.image = iconWeatherImage
                    }
                }
                    let setImageForecastIcon:(UIImage) -> Void = { forecastIconImage in
                        self.forecastImage.append(forecastIconImage)
                    }
                           
            let setWeatherInfo:(WeatherResponse) -> Void = { currentWeather in
                let weatherIcon = currentWeather.weather[0].icon
                self.apiWeather.weatherImageIcon(weatherIcon: weatherIcon, onCompletion: setImageWeatherIcon)
    DispatchQueue.main.async {
            self.weatherDisplay(weathers: currentWeather, cityName: cityname, stateName: statename)
    }
        }
                    let setForecastWeatherInfo:(ForecastList) -> Void = { forecastW in
                        self.numberCells = Int(forecastW.list.count)
                        
                        for index in 0..<forecastW.list.count {
                            self.forecastMainTemp.append(Int(forecastW.list[index].main.temp))
                            let forecastWeatherIcon = forecastW.list[index].weather[0].icon
                            self.apiWeather.weatherImageIcon(weatherIcon: forecastWeatherIcon, onCompletion: setImageForecastIcon)
                            print(self.forecastMainTemp)
                        }
                    }
                self.apiWeather.forecastWeatherInfo(longitude: longi, latitude: lat, onCompletion: setForecastWeatherInfo)
                self.apiWeather.weatherInfo(longitude: longi, latitude: lat, onCompletion: setWeatherInfo)
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("--------------------------------------------- \(numberCells)")
        return numberCells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! ForecastCollectionViewCell
        
        collectionCell.dateInfo.text = "\(self.forecastMainTemp[indexPath.row])°"
        collectionCell.weatherImage.image = self.forecastImage[indexPath.row]
        return collectionCell
    }
}
