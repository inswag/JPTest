//
//  ListReviewCellViewModel.swift
//  JPTest
//
//  Created by Insu Park on 2020/03/29.
//  Copyright © 2020 INSWAG. All rights reserved.
//

import Foundation

class ListReviewCellViewModel {

    let logoPath: String?
    let rateTotalAvg: Double?
    let name: String?
    let industryName: String?
    let reviewSummary: String?
    let pros: String?
    let cons: String?
    
    init(contents: JobPlanet) {
        self.logoPath = contents.logoPath
        self.rateTotalAvg = contents.rateTotalAvg
        self.name = contents.name
        self.industryName = contents.industryName
        self.reviewSummary = contents.reviewSummary
        self.pros = contents.pros
        self.cons = contents.cons
    }
    
}
