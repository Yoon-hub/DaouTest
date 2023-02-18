//
//  CollectionViewCell.swift
//  DaouTest
//
//  Created by 최윤제 on 2023/02/10.
//

import UIKit

import Kingfisher
import SnapKit
import Then

final class ShopListCollectionViewCell: UICollectionViewCell {
    
    let imageView = UIImageView().then {
        $0.layer.cornerRadius = 8
    }
    
    let brandLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.textColor = .systemGray2
    }
    
    let contentLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 16, weight: .regular)
        $0.numberOfLines = 2
    }
    
    let priceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        [imageView, brandLabel, contentLabel, priceLabel].forEach { self.addSubview($0) }
    }
    
    private func setConstraints() {
        imageView.snp.makeConstraints {
            $0.width.height.equalTo(132)
            $0.centerY.equalTo(self)
            $0.leading.equalTo(self).inset(16)
        }
        
        brandLabel.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing).offset(8)
            $0.trailing.equalTo(self).inset(8)
            $0.top.equalTo(imageView)
        }
        
        contentLabel.snp.makeConstraints {
            $0.leading.equalTo(brandLabel)
            $0.top.equalTo(brandLabel.snp.bottom).offset(6)
            $0.trailing.equalTo(self).inset(8)
        }
        
        priceLabel.snp.makeConstraints {
            $0.leading.equalTo(brandLabel)
            $0.top.equalTo(contentLabel.snp.bottom).offset(6)
            $0.trailing.equalTo(self).inset(8)
        }
    }
    
    func bind(_ data: Content) {
        let url = URL(string: data.imgURL)
        imageView.kf.setImage(with: url)
        brandLabel.text = data.brand
        contentLabel.text = data.content
        
        
        priceLabel.text = "\(numberFormat(value: data.price))원"
    }
    
    private func numberFormat(value: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(for: value) ?? "0"
        return result
    }
    

}
