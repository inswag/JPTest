//
//  ListReviewCell.swift
//  JPTest
//
//  Created by Insu Park on 2020/03/29.
//  Copyright © 2020 INSWAG. All rights reserved.
//

import UIKit

class ListReviewCell: TableViewCell {
    
    // MARK:- Properties
    
    var viewModel: ListReviewCellViewModel! {
        didSet {
            let imageURL = URL(string: viewModel.logoPath!)
            logoPathImageView.kf.setImage(with: imageURL)
            name.text = viewModel.name
            rateTotalAvg.text = "\(viewModel.rateTotalAvg!)"
            industryName.text = viewModel.industryName
            reviewSummary.text = viewModel.reviewSummary
            pros.text = viewModel.pros
            cons.text = viewModel.cons
        }
    }
    
    // MARK:- UI Properties
    
    let logoPathImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "default_logo")
        iv.backgroundColor = .lightGray
        return iv
    }()
    
    let name: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.numberOfLines = 2
        label.font = Tools.font.appleSDGothicNeoBold(size: 18)
        return label
    }()
    
    let rateTotalAvg: UILabel = {
        let label = UILabel()
        label.text = "0.0점"
        label.textColor = .black
        return label
    }()
    
    let industryName: UILabel = {
        let label = UILabel()
        label.text = "industryName"
        label.textColor = .lightGray
        label.textAlignment = .left
        return label
    }()
    
    let divisionLineFirst: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let reviewSummary: UILabel = {
        let label = UILabel()
        label.text = "Review Summary"
        label.font = Tools.font.appleSDGothicNeoBold(size: 18)
        label.numberOfLines = 0
        return label
    }()
    
    let prosTitle: UILabel = {
        let label = UILabel()
        label.text = "장점"
        label.textColor = .blue
        return label
    }()
    
    let pros: UILabel = {
        let label = UILabel()
        label.text = "단점이 없는 장점이죠"
        label.numberOfLines = 0
        return label
    }()
    
    let consTitle: UILabel = {
        let label = UILabel()
        label.text = "단점"
        label.textColor = .red
        return label
    }()
    
    let cons: UILabel = {
        let label = UILabel()
        label.text = "장점이 없는게 단점이죠"
        label.numberOfLines = 0
        return label
    }()
    
    let seeMore: UILabel = {
        let label = UILabel()
        label.text = "기업리뷰 더보기"
        label.textColor = .lightGray
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.prosTitle,
                                                       self.pros])
        stackView.axis = .horizontal
        stackView.alignment = .leading
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
    
    // MARK:- UI Methods
    
    override func setupUIComponents() {
        self.backgroundColor = .white
        
        [logoPathImageView,
         name,
         rateTotalAvg,
         industryName,
         divisionLineFirst,
         reviewSummary,
         prosTitle,
         pros,
         consTitle,
         cons,
         seeMore,
         stackView].forEach {
            self.addSubview($0)
        }
    }
    
    override func setupUILayout() {
        logoPathImageView.snp.makeConstraints {
            $0.top.leading.equalTo(16)
            $0.width.height.equalTo(90)
        }
        
        name.snp.makeConstraints {
            $0.top.equalTo(logoPathImageView.snp.top)
            $0.leading.equalTo(logoPathImageView.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        rateTotalAvg.snp.makeConstraints {
            $0.bottom.equalTo(logoPathImageView.snp.bottom)
            $0.leading.equalTo(logoPathImageView.snp.trailing).offset(16)
        }
        
        industryName.snp.makeConstraints {
            $0.top.equalTo(rateTotalAvg.snp.top)
            $0.leading.equalTo(rateTotalAvg.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().offset(-16)
            $0.bottom.equalTo(rateTotalAvg.snp.bottom)
        }
        
        divisionLineFirst.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(logoPathImageView.snp.bottom).offset(16)
        }
        
        reviewSummary.snp.makeConstraints {
            $0.top.equalTo(divisionLineFirst.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }

        prosTitle.snp.makeConstraints {
            $0.top.equalTo(reviewSummary.snp.bottom).offset(32)
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(30)
        }

        pros.snp.makeConstraints {
            $0.top.equalTo(prosTitle.snp.top)
            $0.leading.equalTo(prosTitle.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().offset(-40)
        }

        consTitle.snp.makeConstraints {
            $0.top.equalTo(pros.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(30)

        }

        cons.snp.makeConstraints {
            $0.top.equalTo(consTitle.snp.top)
            $0.leading.equalTo(consTitle.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().offset(-40)
        }

        seeMore.snp.makeConstraints {
            $0.top.equalTo(cons.snp.bottom).offset(24)
            $0.trailing.equalToSuperview().offset(-16)
            $0.bottom.equalToSuperview().offset(-16)
        }
    }
    
    override func setupImplementation() {
        
    }
    
}
