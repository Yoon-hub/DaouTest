//
//  UIViewController+.swift
//  FastlaneTest
//
//  Created by 최윤제 on 2023/01/29.
//

import UIKit

extension UIViewController {
    enum TransitionStyle {
        case naviagtion
        case overFull
    }
    
    func transition<T: UIViewController>(_ vc: T, transitionStyle: TransitionStyle) {
        switch transitionStyle {
        case .naviagtion:
            navigationController?.pushViewController(vc, animated: true)
        case .overFull:
            present(vc, animated: true)
        }
    }
    

    func showAlert(message: String) -> UIAlertController {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .cancel)
        alert.addAction(ok)
        return alert
    }
    
}

