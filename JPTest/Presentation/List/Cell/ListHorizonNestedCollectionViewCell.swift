//
//  ListHorizonNestedCollectionViewCell.swift
//  JPTest
//
//  Created by Insu Park on 2020/03/30.
//  Copyright © 2020 INSWAG. All rights reserved.
//

import UIKit

class ListHorizonNestedCollectionViewCell: UICollectionViewCell {

    // MARK:- Properties
    
    var viewModel: ListHorizonNestedCellViewModel! {
        didSet {
            let imageURL = URL(string: viewModel.coverImage)
            coverImageView.kf.setImage(with: imageURL)
            title.text = viewModel.title
        }
    }
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var title: UILabel!
    
    
    override func prepareForReuse() {

    }
    
}
