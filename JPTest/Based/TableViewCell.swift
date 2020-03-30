//
//  TableViewCell.swift
//  JPTest
//
//  Created by Insu Park on 2020/03/28.
//  Copyright © 2020 INSWAG. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell, UIProtocol {
    
    // MARK:- Initialize
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .white
        setupUIComponents()
        setupUILayout()
        setupImplementation()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUIComponents() {
        
    }
    
    func setupUILayout() {
        
    }

    func setupImplementation() {
        
    }
    
}

