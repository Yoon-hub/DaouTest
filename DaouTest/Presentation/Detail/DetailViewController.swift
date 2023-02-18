//
//  DetailViewController.swift
//  DaouTest
//
//  Created by 최윤제 on 2023/02/10.
//

import UIKit

final class DetailViewController: UIViewController {
    
    let detailView = DetailView()
    
    let viewModel = DetailViewModel()

    override func loadView() {
        self.view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
}

//Configure
extension DetailViewController {
    
    private func configure() {
        detailView.bind(viewModel.itemData)
    }
}
