//
//  ReusableProtocol.swift
//  FastlaneTest
//
//  Created by 최윤제 on 2023/01/27.
//

import UIKit

protocol ReusableProtocol {
    static var reusable: String { get }
}

extension UICollectionReusableView: ReusableProtocol {
    static var reusable: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableProtocol {
    static var reusable: String {
        return String(describing: self)
    }
}

