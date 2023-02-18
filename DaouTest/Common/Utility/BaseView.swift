//
//  BaseView.swift
//  FastlaneTest
//
//  Created by 최윤제 on 2023/01/26.
//

import UIKit

open class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        setConstraints()
        backgroundColor = .white
        
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() { }
    func setConstraints() { }
}

