//
//  Navigator.swift
//  JPTest
//
//  Created by Insu Park on 2020/03/23.
//  Copyright © 2020 INSWAG. All rights reserved.
//

import UIKit

class Navigator {
    
    enum Scene {
        case basicList
        case basicDetail
    }
    
    func get(segue: Scene) -> UIViewController {
        switch segue {
        case .basicList:
            let basicList = BasicListViewController()
            return basicList
        case .basicDetail:
            let basicDetail = BasicDetailViewController()
            return basicDetail
        }
    }
    
    
}
