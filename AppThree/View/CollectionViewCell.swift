//
//  CollectionViewCell.swift
//  AppThree
//
//  Created by Meruert on 03.11.2022.
//

import UIKit
import SnapKit

class CollectionViewCell: UICollectionViewCell {
    
    lazy private var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "night"
        return label
    }()
    
    
    
    lazy private var conditionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "snow")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        return imageView
    }()
    
    
    
    lazy private var degreeLabel: UILabel = {
        let label = UILabel()
        label.text = "-38°"
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                        
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


private extension CollectionViewCell {
    
    func setupViews() {
        contentView.addSubview(timeLabel)
        contentView.addSubview(conditionImageView)
        contentView.addSubview(degreeLabel)
    }
    
    func setupConstraints() {
        timeLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.33)
//            make.size;10
        }
        conditionImageView.snp.makeConstraints { make in
            make.top.equalTo(timeLabel.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.34)
        }
        degreeLabel.snp.makeConstraints { make in
            make.top.equalTo(conditionImageView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
