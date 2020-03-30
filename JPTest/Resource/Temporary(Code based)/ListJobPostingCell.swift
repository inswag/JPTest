//
//  ListJobPostingCell.swift
//  JPTest
//
//  Created by Insu Park on 2020/03/29.
//  Copyright © 2020 INSWAG. All rights reserved.
//

import UIKit
import Kingfisher

class ListJobPostingCell: TableViewCell {

    // MARK:- Properties

    var viewModel: ListJobPostingCellViewModel! {
        didSet {
            let imageURL = URL(string: viewModel.logo!)
            logoImageView.kf.setImage(with: imageURL)

            companyName.text = viewModel.companyName
            reviewAvgCache.text = "별 \(viewModel.reviewAvgCache!)"
            title.text = viewModel.title
            message.text = viewModel.message
            
            
//            self.logo = contents.logo
//            self.companyName = contents.companyName
//            self.message = contents.deadline?.message
//            self.title = contents.title
//            self.reviewAvgCache = contents.reviewAvgCache
            
        }
    }
    
    // MARK:- UI Properties
    
    let logoImageView: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "default_logo")
        iv.backgroundColor = .lightGray
        return iv
    }()
    
    let companyName: UILabel = {
       let label = UILabel()
        label.text = "companyName"
        label.font = Tools.font.appleSDGothicNeoRegular(size: 18)
        label.textAlignment = .left
        label.textColor = .lightGray
        return label
    }()
    
    let title: UILabel = {
       let label = UILabel()
        label.text = "Title"
        label.font = Tools.font.appleSDGothicNeoBold(size: 18)
        label.textColor = .black
        label.textAlignment = .left

        return label
    }()
    
    let message: UILabel = {
       let label = UILabel()
        label.text = "TEST"
        label.font = Tools.font.appleSDGothicNeoRegular(size: 18)
        label.textColor = .lightGray
        label.textAlignment = .left
        return label
    }()
    
    let reviewAvgCache: UILabel = {
       let label = UILabel()
        label.text = "평점"
        label.font = Tools.font.appleSDGothicNeoRegular(size: 18)
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.companyName,
                                                       self.title,
                                                       self.message])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()
    
    
    // MARK:- Initialize
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: .default,
                   reuseIdentifier: String(describing: ListViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- View Life Cycle
    
    
    
    // MARK:- UI Methods
    
    override func setupUIComponents() {
        self.backgroundColor = .white
        
        [logoImageView,
         stackView,
         reviewAvgCache].forEach {
            self.addSubview($0)
        }
    }
    
    override func setupUILayout() {
        logoImageView.snp.makeConstraints {
            $0.top.leading.equalTo(16)
            $0.width.height.equalTo(90)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.top)
            $0.leading.equalTo(logoImageView.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(90)
        }
        
        reviewAvgCache.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalTo(logoImageView.snp.trailing)
            $0.bottom.equalToSuperview().offset(-16)
            $0.height.equalTo(30)
        }
        
    }
    
    override func setupImplementation() {
        
    }
    
    // MARK:- Methods
    
    
    
}
