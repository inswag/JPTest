//
//  ListHorizonCellViewModel.swift
//  JPTest
//
//  Created by Insu Park on 2020/03/28.
//  Copyright © 2020 INSWAG. All rights reserved.
//

import Foundation

class ListHorizonCellViewModel {
    
    // MARK:- Collection View Cell Type
    
    enum CellType {
        case rectangle
    }
    
    // MARK:- Properties
    
    var themes: [Themes]
    
    // MARK:- Initialize
    
    init(themes: [Themes]) {
        self.themes = themes
    }
    
    // MARK:- Methods
    
    func numberOfItemsInSection() -> Int {
        return themes.count
    }
}


