//
//  HomeViewModel.swift
//  DaouTest
//
//  Created by 최윤제 on 2023/02/10.
//

import Foundation

import RxSwift

final class HomeViewModel {
    
    var pageNumber = 0
    
    var totalPages: Int?
    
    var totalData: [Content] = []
    
    var totalData2 = PublishSubject<[Content]>()
    
    func requestData(completion: @escaping ([Content]) -> Void) {
        
        let api = DaouAPI.requestAll(page: "\(pageNumber)")
        
        APIService.shared.apiIntegration(type: DaouData.self, api: api, method: .get) { [weak self] response, statusCode in
            switch response {
            case .success(let data):
                print(data)
                self?.totalPages = data.totalPages
                self?.totalData.append(contentsOf: data.content)
                completion(self!.totalData)
            case .failure(let failure):
                print(failure)
            }
        }
        
    }
    
}
