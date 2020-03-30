//
//  ListViewControllerViewModel.swift
//  JPTest
//
//  Created by Insu Park on 2020/03/24.
//  Copyright © 2020 INSWAG. All rights reserved.
//

import UIKit
import Moya

final class ListViewControllerViewModel {
    
    // MARK:- Cell Type
    
    enum CellType: String {
        case company = "CELL_TYPE_COMPANY"
        case horizontalTheme = "CELL_TYPE_HORIZONTAL_THEME"
        case jobPosting = "CELL_TYPE_JOB_POSTING"
        case review = "CELL_TYPE_REVIEW"
        case salary = "CELL_TYPE_SALARY"
        case interview = "CELL_TYPE_INTERVIEW"
    }
    
    // MARK:- Properties
    
    let provider = MoyaProvider<JobPlanetRouter>()
    var fetchedDataList: [JobPlanet] = []
    
    // MARK:- Initialize

    // MARK:- Methods
    
    func fetchDataList(completion: @escaping () -> ()) {
        provider.request(.basic) { [weak self] result in
            switch result {
            case .success(let response):
                do {
                    guard let self = self else { return }
                    let result = try JSONDecoder().decode(JobPlanetRoot.self, from: response.data)
                    self.fetchedDataList = result.items
                    completion()
                } catch let err {
                    print(err)
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK:- Table View
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRowsInSection() -> Int {
        print("self.fetchedDataList.count : ", self.fetchedDataList.count)
        return self.fetchedDataList.count
    }
    
}
