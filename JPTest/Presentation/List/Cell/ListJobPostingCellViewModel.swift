//
//  ListJobPostingCellViewModel.swift
//  JPTest
//
//  Created by Insu Park on 2020/03/29.
//  Copyright © 2020 INSWAG. All rights reserved.
//

import Foundation

class ListJobPostingCellViewModel {

    // MARK:- Properties
    
    let logo: String?
    let companyName: String?
    let message: String?
    let title: String?
    let reviewAvgCache: Double?
    
    // MARK:- Initialize
    
    init(contents: JobPlanet) {
        self.logo = contents.logo
        self.companyName = contents.companyName
        self.message = contents.deadline?.message
        self.title = contents.title
        self.reviewAvgCache = contents.reviewAvgCache
    }
    
}
