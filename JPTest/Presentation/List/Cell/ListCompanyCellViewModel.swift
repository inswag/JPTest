//
//  ListCompanyCellViewModel.swift
//  JPTest
//
//  Created by Insu Park on 2020/03/28.
//  Copyright © 2020 INSWAG. All rights reserved.
//

import UIKit

class ListCompanyCellViewModel {
    
    // MARK:- Properties
    
    let logoPath: String?
    let rateTotalAvg: Double?
    let name: String?
    let industryName: String?
    let reviewSummary: String?
    let salaryAvg: Int?
    let interviewQuestion: String?
    
    // MARK:- Initialize
    
    init(contents: JobPlanet) {
        self.logoPath = contents.logoPath
        self.rateTotalAvg = contents.rateTotalAvg
        self.name = contents.name
        self.industryName = contents.industryName
        self.reviewSummary = contents.reviewSummary
        self.salaryAvg = contents.salaryAvg
        self.interviewQuestion = contents.interviewQuestion
    }
    
}
