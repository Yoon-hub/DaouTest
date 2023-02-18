//
//  HomeView.swift
//  DaouTest
//
//  Created by 최윤제 on 2023/02/10.
//

import UIKit

import SnapKit
import Then

final class HomeView: BaseView {
    
    let logoImage = UIImageView().then {
        $0.image = UIImage(named: "Logo")
    }
    
    let textField = UITextField().then {
        $0.font = .systemFont(ofSize: 15)
        $0.setLeftPaddingPoints(40)
        $0.backgroundColor = .textFieldBackGroundColor
        $0.layer.cornerRadius = 12
        $0.placeholder = "검색어를 입력해주세요"
    }
    
    let searchButton = UIButton().then {
        $0.setImage(UIImage(named: "search"), for: .normal)
    }
    
    let floatyButton = UIButton().then {
        $0.setImage(UIImage(named: "Floating"), for: .normal)
    }
    
    let shopListCollectionView = {
        let layout =  UICollectionViewFlowLayout()
        let spacing : CGFloat = 4
        let width = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: width, height: 152)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(ShopListCollectionViewCell.self, forCellWithReuseIdentifier: ShopListCollectionViewCell.reusable)
        return view
    }()
    
    override func configure() {
        [logoImage, textField, searchButton, shopListCollectionView, floatyButton].forEach { self.addSubview($0) }
    }
    
    override func setConstraints() {
        logoImage.snp.makeConstraints {
            $0.centerX.equalTo(self)
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(16)
            $0.width.equalTo(135)
            $0.height.equalTo(19)
        }
        
        textField.snp.makeConstraints {
            $0.centerX.equalTo(self)
            $0.top.equalTo(logoImage.snp.bottom).offset(24)
            $0.horizontalEdges.equalTo(self).inset(16)
            $0.height.equalTo(44)
        }
        
        searchButton.snp.makeConstraints {
            $0.centerY.equalTo(textField)
            $0.leading.equalTo(textField).inset(8)
        }
        
        shopListCollectionView.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom).offset(16)
            $0.horizontalEdges.bottom.equalTo(self.safeAreaLayoutGuide)
        }
        
        floatyButton.snp.makeConstraints {
            $0.width.height.equalTo(76)
            $0.bottom.equalTo(self).inset(32)
            $0.trailing.equalTo(self).inset(16)
        }
        
    }
    
}

