//
//  ListJobPostingTableViewCell.swift
//  JPTest
//
//  Created by Insu Park on 2020/03/30.
//  Copyright © 2020 INSWAG. All rights reserved.
//

import UIKit

class ListJobPostingTableViewCell: UITableViewCell {
    
    // MARK:- Properties
    
    var viewModel: ListJobPostingCellViewModel! {
        didSet {
            let imageURL = URL(string: viewModel.logo!)
            logo.kf.setImage(with: imageURL)

            companyName.text = viewModel.companyName
            reviewAvgCache.text = "\(viewModel.reviewAvgCache!)"
            title.text = viewModel.title
            message.text = viewModel.message
        }
    }
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var reviewAvgCache: UILabel!
    
    
}
