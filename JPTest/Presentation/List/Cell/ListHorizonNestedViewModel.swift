//
//  ListHorizonNestedViewModel.swift
//  JPTest
//
//  Created by Insu Park on 2020/03/29.
//  Copyright © 2020 INSWAG. All rights reserved.
//

import Foundation

class ListHorizonNestedCellViewModel {
    
    // MARK:- Properties
    
    let title: String
    let coverImage: String
        
    // MARK:- Initialize
    
    init(contents: Themes) {
        self.title = contents.title
        self.coverImage = contents.coverImage
    }
}
