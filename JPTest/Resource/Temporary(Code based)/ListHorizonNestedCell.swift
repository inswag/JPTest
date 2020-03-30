//
//  ListHorizonNestedCell.swift
//  JPTest
//
//  Created by Insu Park on 2020/03/28.
//  Copyright © 2020 INSWAG. All rights reserved.
//

import UIKit

class ListHorizonNestedCell: CollectionViewCell {
    
    // MARK:- Properties
    
    var viewModel: ListHorizonNestedCellViewModel! {
        didSet {
            let imageURL = URL(string: viewModel.coverImage)
            coverImageView.kf.setImage(with: imageURL)
            title.text = viewModel.title
        }
    }
    
    // MARK:- UI Properties
    
    let coverImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.text = "공범모집\n공범모집\n공범모집"
        label.textAlignment = .center
        label.numberOfLines = 3
        return label
    }()
    
    // MARK:- Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- UI Methods
    
    override func setupUIComponents() {
        [coverImageView,
         containerView].forEach {
            self.addSubview($0)
        }
        
        [title].forEach {
            self.addSubview($0)
        }
    }
    
    override func setupUILayout() {
        coverImageView.snp.makeConstraints {
            $0.width.height.equalTo(180)
            $0.top.leading.trailing.equalToSuperview()
        }
        
        containerView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(coverImageView.snp.bottom)
        }
        
        title.snp.makeConstraints {
            $0.top.equalTo(coverImageView.snp.bottom).offset(8)
            $0.leading.equalTo(containerView.snp.leading).offset(8)
            $0.trailing.equalTo(containerView.snp.trailing).offset(-8)
            $0.bottom.equalTo(containerView.snp.bottom).offset(-8)
        }
    }
    
    override func setupImplementation() {
        
    }
    
}
