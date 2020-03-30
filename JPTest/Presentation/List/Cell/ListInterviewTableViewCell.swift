//
//  ListInterviewTableViewCell.swift
//  JPTest
//
//  Created by Insu Park on 2020/03/30.
//  Copyright © 2020 INSWAG. All rights reserved.
//

import UIKit

class ListInterviewTableViewCell: UITableViewCell {

    // MARK:- Properties
    
    var viewModel: ListInterviewCellViewModel! {
        didSet {
            let imageURL = URL(string: viewModel.logoPath!)
            logoPathImageView.kf.setImage(with: imageURL)
            name.text = viewModel.name
            rateTotalAvg.text = "\(viewModel.rateTotalAvg!)"
            industryName.text = viewModel.industryName
            interviewQuestion.text = viewModel.interviewQuestion
        }
    }
    
    @IBOutlet weak var logoPathImageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var rateTotalAvg: UILabel!
    @IBOutlet weak var industryName: UILabel!
    @IBOutlet weak var interviewQuestion: UILabel!
    
    
}
