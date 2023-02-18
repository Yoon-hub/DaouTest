//
//  HomeViewController.swift
//  DaouTest
//
//  Created by 최윤제 on 2023/02/10.
//

import UIKit

import RxSwift
import RxCocoa

final class HomeViewController: UIViewController {
    
    let homeView = HomeView()
    
    let viewModel = HomeViewModel()
    
    private var disposeBag = DisposeBag()
    
    override func loadView() {
        self.view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionViewItemSelected()
        configure()
        bindCollectionView()
        requestData()
        floatyButtonBind()

    }
}


//MARK: - Configure
extension HomeViewController {
    
    private func configure() {
        homeView.shopListCollectionView.prefetchDataSource = self
        //homeView.shopListCollectionView.delegate = self
    }
    
    private func floatyButtonBind() {
        homeView.floatyButton.rx.tap
            .bind { [weak self] in
                self?.homeView.shopListCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
                
            }.disposed(by: disposeBag)
    }
    
    private func bindCollectionView() {
        viewModel.totalData2.bind(to: homeView.shopListCollectionView.rx.items(cellIdentifier: ShopListCollectionViewCell.reusable, cellType: ShopListCollectionViewCell.self))
        { index, data, cell in
            cell.bind(data)
        }
        .disposed(by: disposeBag)
    }
    
    private func requestData() {
        viewModel.requestData { [weak self] totalContent in
            self?.viewModel.totalData2.onNext(totalContent)
        }
    }
    
    private func collectionViewItemSelected() {
        homeView.shopListCollectionView.rx.itemSelected
            .withUnretained(self)
            .bind { (vc, index) in

                //화면전환 코드
                let detailView = DetailViewController()
                detailView.viewModel.itemData = vc.viewModel.totalData[index.item]
                vc.transition(detailView, transitionStyle: .naviagtion)

            }
            .disposed(by: disposeBag)
    }
}


//MARK: - Pagination
extension HomeViewController: UICollectionViewDataSourcePrefetching, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
        for i in indexPaths {
            if viewModel.pageNumber + 1 <= viewModel.totalPages! && i.item > (viewModel.pageNumber * 20) {
                viewModel.pageNumber += 1
                requestData()
            }
        }
    }
    
}

