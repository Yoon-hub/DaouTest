//
//  DetailView.swift
//  DaouTest
//
//  Created by 최윤제 on 2023/02/10.
//

import UIKit

import Kingfisher
import SnapKit
import Then

final class DetailView: BaseView {
    
    let scrollView = UIScrollView()
    
    let contentView = UIView()
    
    let logoImage = UIImageView().then {
        $0.image = UIImage(named: "Logo")
    }
    
    let imageView = UIImageView()
    
    let buyButton = UIButton().then {
        $0.layer.cornerRadius = 8
        $0.setTitle("구매하기", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.backgroundColor = .black
    }
    
    let brandLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.textColor = .systemGray2
    }
    
    let nameLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 16, weight: .regular)
        $0.numberOfLines = 2
    }
    
    let priceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    let optionLabel = UILabel().then {
        $0.text = "옵션 선택"
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.textColor = .systemGray2
    }
    
    let optionView1 = UIView().then {
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemGray3.cgColor
    }
    
    let optionView2 = UIView().then {
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemGray3.cgColor
    }
    
    
    let downImageView = UIImageView().then {
        $0.image = UIImage(named: "down")
    }
    
    override func configure() {
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.addSubview(buyButton)
        [logoImage, imageView, brandLabel, nameLabel, priceLabel, optionLabel, optionView1, optionView2, downImageView].forEach { contentView.addSubview($0) }
    }
    
    override func setConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(scrollView.contentLayoutGuide)
            $0.bottom.equalTo(scrollView.contentLayoutGuide).inset(20)
            $0.width.equalTo(scrollView)
            $0.height.equalTo(1500)
        }
        
        buyButton.snp.makeConstraints {
            $0.height.equalTo(56)
            $0.horizontalEdges.equalTo(self).inset(16)
            $0.bottom.equalTo(self).inset(52 )
        }
        
        logoImage.snp.makeConstraints {
            $0.top.equalTo(contentView).offset(16)
            $0.leading.equalTo(contentView).inset(17)
            $0.width.equalTo(86)
            $0.height.equalTo(12)
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom).offset(14)
            $0.horizontalEdges.equalTo(contentView).inset(16)
            $0.height.equalTo(imageView.snp.width)
        }
        
        brandLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(22)
            $0.leading.equalTo(contentView).inset(16)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(brandLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalTo(contentView).inset(16)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(8)
            $0.leading.equalTo(nameLabel)
        }
        
        optionLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(30)
            $0.leading.equalTo(nameLabel)
        }
        
        optionView1.snp.makeConstraints {
            $0.top.equalTo(optionLabel.snp.bottom).offset(8)
            $0.height.equalTo(48)
            $0.horizontalEdges.equalTo(contentView).inset(16)
        }
        
        downImageView.snp.makeConstraints {
            $0.centerY.equalTo(optionView1)
            $0.trailing.equalTo(optionView1).inset(8)

        }
    }
    
    func bind(_ data: Content) {
        let url = URL(string: data.imgURL)
        imageView.kf.setImage(with: url)
        
        brandLabel.text = data.brand
        nameLabel.text = data.name
        priceLabel.text = "\(numberFormat(value: data.price))원"
    }
    
    private func numberFormat(value: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(for: value) ?? "0"
        return result
    }
    
}

