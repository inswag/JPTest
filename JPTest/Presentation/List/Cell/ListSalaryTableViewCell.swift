//
//  ListSalaryTableViewCell.swift
//  JPTest
//
//  Created by Insu Park on 2020/03/30.
//  Copyright © 2020 INSWAG. All rights reserved.
//

import UIKit

class ListSalaryTableViewCell: UITableViewCell {

    // MARK:- Properties

    var viewModel: ListSalaryCellViewModel! {
        didSet {
            let imageURL = URL(string: viewModel.logoPath!)
            logoPathImageView.kf.setImage(with: imageURL)

            name.text = viewModel.name
            rateTotalAvg.text = "\(viewModel.rateTotalAvg!)"
            industryName.text = viewModel.industryName

            
            salaryAvg.text = "\(viewModel.salaryAvg!) 만원"
            salaryLowest.text = "\(viewModel.salaryLowest!)"
            salaryHighest.text = "\(viewModel.salaryHighest!)"
        }
    }
    
    @IBOutlet weak var logoPathImageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var rateTotalAvg: UILabel!
    @IBOutlet weak var industryName: UILabel!
    @IBOutlet weak var salaryAvg: UILabel!
    @IBOutlet weak var salaryLowest: UILabel!
    @IBOutlet weak var salaryHighest: UILabel!
    
    
    
}
