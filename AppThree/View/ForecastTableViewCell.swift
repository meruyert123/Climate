//
//  ForecastTableViewCell.swift
//  AppThree
//
//  Created by Meruert on 03.11.2022.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {
    
    lazy private var dayLabel: UILabel = {
        let label = UILabel()
        label.text = "Night"
        return label
    }()
    
    
    
    lazy private var conditionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "snow")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        return imageView
    }()
    
    
    
    lazy private var degreeLowLabel: UILabel = {
        let label = UILabel()
        label.text = "-31°"
        return label
    }()
    
    
    
    
    lazy private var rowLabel: UILabel = {
        let label = UILabel()
        label.text = "-------"
        return label
    }()
    
    
    
    lazy private var degreeHighLabel: UILabel = {
        let label = UILabel()
        label.text = "-35°"
        return label
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                        
        setupViews()
        setupConstraints()
        changeLabelText()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeLabelText() {
        let subviews = contentView.subviews
        for subview in subviews {
            if subview is UILabel {
                let currentLabel = subview as! UILabel
                currentLabel.textAlignment = .center
                currentLabel.textColor = .white
            }
        }
    }
}
private extension ForecastTableViewCell {
    
    func setupViews() {
        contentView.addSubview(dayLabel)
        contentView.addSubview(conditionImageView)
        contentView.addSubview(degreeLowLabel)
        contentView.addSubview(rowLabel)
        contentView.addSubview(degreeHighLabel)
    }
    
    func setupConstraints() {
        dayLabel.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.25)
        }
        conditionImageView.snp.makeConstraints { make in
            make.leading.equalTo(dayLabel.snp.trailing)
            make.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.1)
        }
        degreeLowLabel.snp.makeConstraints { make in
            make.leading.equalTo(conditionImageView.snp.trailing)
            make.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.125)
        }
        rowLabel.snp.makeConstraints { make in
            make.leading.equalTo(degreeLowLabel.snp.trailing)
            make.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.40)
        }
        degreeHighLabel.snp.makeConstraints { make in
            make.leading.equalTo(rowLabel.snp.trailing)
            make.top.bottom.trailing.equalToSuperview()
        }
    }
}
