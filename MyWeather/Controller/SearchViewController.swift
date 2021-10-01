//
//  SearchViewController.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 3/4/21.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate, UICollectionViewDataSource {
    
    let layoutForecast = UICollectionViewFlowLayout()
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
    var apiWeather = WeatherAPI()
    let searchView = SearchOptionView()
    let otherView = OtherSearchOptionView()
    let scroll = UIScrollView()
    var numberCells = Int()
    var forecastMainTemp = [Int]()
    var forecastDate = [String]()
    var forecastDateInfo = [String]()
    var forecastImageString = [String]()
    var forecastImage = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = bgColor.withAlphaComponent(0.9)
        constrain()
    }
    
    func constrain() {
        self.searchView.search.delegate = self
        
        layoutForecast.itemSize = CGSize(width: view.frame.width/5, height: 110)
        layoutForecast.scrollDirection = .horizontal
        layoutForecast.minimumLineSpacing = 0
        
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layoutForecast)
        self.collectionView.isScrollEnabled = true
        self.collectionView.backgroundColor = .clear
        self.collectionView.register(SearchForecastCollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        self.collectionView.dataSource = self
        
        view.addConstrainedSubviews(searchView, collectionView, scroll)
        scroll.addConstrainedSubviews(otherView)
        
        NSLayoutConstraint.activate([
            
            searchView.topAnchor.constraint(equalTo: view.topAnchor),
            searchView.heightAnchor.constraint(equalToConstant: 400),
            searchView.widthAnchor.constraint(equalTo: view.widthAnchor),
            searchView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            collectionView.topAnchor.constraint(equalTo: searchView.bottomAnchor),
            collectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 110),
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            scroll.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scroll.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            otherView.topAnchor.constraint(equalTo: scroll.topAnchor),
            otherView.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            otherView.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
            otherView.centerXAnchor.constraint(equalTo: scroll.centerXAnchor),
            otherView.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
        ])
    }
    
    func checkSearch() {
        guard let cityName = self.searchView.search.text else {
            return
        }
        searchStart(city: cityName)
    }
    
    func searchStart(city: String) {
        
        let setImageForecastIcon:(UIImage) -> Void = { forecastIconImage in
            self.forecastImage.append(forecastIconImage)
        }
        
        let setForecastWeatherInfo:(ForecastList) -> Void = { forecastW in
            self.numberCells = Int(forecastW.list.count)
            
            for index in 0..<forecastW.list.count {
                self.forecastMainTemp.append(Int(forecastW.list[index].main.temp))
                self.forecastDate.append(forecastTimeSet(convertTime: Double(forecastW.list[index].dt!)))
                self.forecastDateInfo.append(forecastDateSet(convertTime: Double(forecastW.list[index].dt!)))
                let forecastWeatherIcon = forecastW.list[index].weather[0].icon
                self.apiWeather.weatherImageIcon(weatherIcon: forecastWeatherIcon, onCompletion: setImageForecastIcon)
                print(self.forecastMainTemp)
            }
        }
        
        self.apiWeather.searchForecastWeatherInfo(cityName: city, onCompletion: setForecastWeatherInfo)
        
        let cityDisplayName = city.replacingOccurrences(of: " ", with: "%20")
        let setImageWeatherIcon:(UIImage) -> Void = { iconWeatherImage in
            DispatchQueue.main.async {
                self.searchView.weatherImage.image = iconWeatherImage
            }
        }
        
        let setWeatherInfo:(WeatherResponse) -> Void = { currentWeather in
            let weatherIcon = currentWeather.weather[0].icon
            self.apiWeather.weatherImageIcon(weatherIcon: weatherIcon, onCompletion: setImageWeatherIcon)
        DispatchQueue.main.async {
            self.weatherDisplay(weathers: currentWeather, cityName: self.searchView.search.text!)
        }
            }
            self.apiWeather.weatherCityInfo(city: cityDisplayName, onCompletion: setWeatherInfo)
        
        viewDidLoad()
    }
    
    func weatherDisplay(weathers: WeatherResponse, cityName: String) {
        
        let progressNumber = Float(weathers.main.humidity)
        let feelTemp = Int(weathers.main.feels_like.rounded())
        let windInfo = Int(weathers.wind.speed.rounded())
        let sunset = weathers.time.sunset
        let sunsetTime = sunsetSunriseTimeSet(convertTime: Double(sunset))
        let sunrise = weathers.time.sunrise
        let lowTemp = Int(weathers.main.lowTemp.rounded())
        let highTemp = Int(weathers.main.highTemp.rounded())
        let sunriseTime = sunsetSunriseTimeSet(convertTime: Double(sunrise))
        let windDir = windLocation(weathers.wind.degree)
        let descrip = weathers.weather[0].description.capitalized
        let currentTemp = Int(weathers.main.temp.rounded())
        
        let progNum = progressNumber/100
        UIView.animate(withDuration: 4) {
            self.otherView.humidityBar.setValue(progNum, animated: true)
        }
        
        searchView.weatherLabel.text = "\(currentTemp)°"
        searchView.cityName.text = "\(cityName.capitalized), "
        searchView.stateName.text = weathers.time.country
        searchView.highTemp.text = "\(Int(weathers.main.highTemp.rounded()))"
        searchView.lowTemp.text = "\(Int(weathers.main.lowTemp.rounded()))"
        
        self.otherView.windInfo.text = "\(windDir) \(windInfo) mph"
        self.otherView.feelsLike.text = "\(feelTemp)°"
        self.otherView.weatherDescrip.text = "\(descrip) today. Forecast shows a high of \(highTemp)° and low of \(lowTemp)°"
        self.otherView.sunrise.text = "\(sunriseTime)am"
        self.otherView.sunset.text = "\(sunsetTime)pm"
        self.otherView.humidityNumber.text = "\(weathers.main.humidity)%"
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.checkSearch()
        self.searchView.search.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchView.search.text = ""
        self.searchView.search.endEditing(true)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberCells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! SearchForecastCollectionViewCell
        
        collectionCell.dateInfo.text = "\(self.forecastDateInfo[indexPath.row])"
        collectionCell.timeInfo.text = "\(self.forecastDate[indexPath.row])"
        collectionCell.weatherImage.image = self.forecastImage[indexPath.row]
        collectionCell.mainWeatherLabel.text = "\(self.forecastMainTemp[indexPath.row])°"
        
        return collectionCell
    }
}


