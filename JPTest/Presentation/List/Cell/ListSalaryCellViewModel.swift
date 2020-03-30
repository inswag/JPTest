//
//  ListSalaryCellViewModel.swift
//  JPTest
//
//  Created by Insu Park on 2020/03/29.
//  Copyright © 2020 INSWAG. All rights reserved.
//

import Foundation

class ListSalaryCellViewModel {

    let logoPath: String?
    let rateTotalAvg: Double?
    let name: String?
    let industryName: String?
    
    let salaryAvg: Int?
    let salaryLowest: Int?
    let salaryHighest: Int?
    
    
    init(contents: JobPlanet) {
        self.logoPath = contents.logoPath
        self.rateTotalAvg = contents.rateTotalAvg
        self.name = contents.name
        self.industryName = contents.industryName
        
        self.salaryAvg = contents.salaryAvg
        self.salaryLowest = contents.salaryLowest
        self.salaryHighest = contents.salaryHighest
       
    }
    
}
