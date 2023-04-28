//
//  WeatherTableViewHeaderView.swift
//  AppThree
//
//  Created by Meruert on 26.10.2022.
//

import UIKit
final class WeatherTableViewHeaderView: UITableViewHeaderFooterView {
//    var weatherManager: WeatherManager?
    lazy private var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Kokshetau"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    
    
    lazy private var degreeLabel: UILabel = {
        let label = UILabel()
        label.text = "-30°"
        label.font = UIFont.systemFont(ofSize: 90)
        label.textAlignment = .center
        return label
    }()
    
    
    
    lazy private var weatherLabel: UILabel = {
        let label = UILabel()
        label.text = "Snow"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        return label
    }()
    
//    lazy private var backgroundBlurEffectView: UIVisualEffectView = {
//        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.systemThinMaterialLight)
//        let blurEffectView = UIVisualEffectView(effect: blurEffect)
//        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        return blurEffectView
//    }()
    
    
    
    lazy private var highLowLabel: UILabel = {
        let label = UILabel()
        label.text = "H:-35° L:-29°"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
//        weatherManager?.delegate = self
        setupViews()
        setupConstraints()
        changeAllTextColor(with: .white)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeAllTextColor(with color: UIColor) {
        let subviews = contentView.subviews
        for subview in subviews {
            if subview is UILabel {
                let currentLabel = subview as! UILabel
                currentLabel.textColor = color
            }
        }
    }
//    func updateHeaderView(with model: WeatherModel) {
//        cityLabel.text = model.cityName
//        degreeLabel.text = model.temp
//        weatherLabel.text = model.description
//        highLowLabel.text = "H: \(model.maxTemp) L: \(model.minTemp)"
//    }
}
extension WeatherTableViewHeaderView: WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager, with model: WeatherModel) {
        
        DispatchQueue.main.async {
            self.cityLabel.text = model.cityName
            self.degreeLabel.text = "\(model.temp)"
            self.weatherLabel.text = model.description
            self.highLowLabel.text = "H: \(model.maxTemp) L: \(model.minTemp)"
           
        }

    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}

private extension WeatherTableViewHeaderView {
    
    func setupViews() {
//        contentView.addSubview(backgroundBlurEffectView)
        contentView.addSubview(cityLabel)
        contentView.addSubview(degreeLabel)
        contentView.addSubview(weatherLabel)
        contentView.addSubview(highLowLabel)
    }
    
    func setupConstraints() {
        cityLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(degreeLabel.snp.top).offset(15)
        }
        degreeLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        weatherLabel.snp.makeConstraints { make in
            make.top.equalTo(degreeLabel.snp.bottom).inset(15)
            make.centerX.equalToSuperview()
        }
        highLowLabel.snp.makeConstraints { make in
            make.top.equalTo(weatherLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
    }
}
