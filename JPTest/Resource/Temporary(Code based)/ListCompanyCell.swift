//
//  ListCompanyCell.swift
//  JPTest
//
//  Created by Insu Park on 2020/03/28.
//  Copyright © 2020 INSWAG. All rights reserved.
//

import UIKit
import Kingfisher

class ListCompanyCell: TableViewCell {

    // MARK:- Properties
    
    var viewModel: ListCompanyCellViewModel! {
        didSet {
            let imageURL = URL(string: viewModel.logoPath!)
            logoPathImageView.kf.setImage(with: imageURL)
            
            name.text = viewModel.name
            rateTotalAvg.text = "별 \(viewModel.rateTotalAvg!)"
            industryName.text = viewModel.industryName

            reviewSummary.text = viewModel.reviewSummary
            salaryAvg.text = "\(viewModel.salaryAvg!) 만원"
            interviewQuestion.text = viewModel.interviewQuestion
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
        label.numberOfLines = 0
        return label
    }()
    
    let salaryAvgTitle: UILabel = {
        let label = UILabel()
        label.text = "평균연봉"
        label.textColor = .green
        return label
    }()
    
    let salaryAvg: UILabel = {
        let label = UILabel()
        label.text = "50,000 만원"
        return label
    }()
    
    let interviewQuestionTitle: UILabel = {
        let label = UILabel()
        label.text = "면접질문"
        return label
    }()
    
    let interviewQuestion: UILabel = {
        let label = UILabel()
        label.text = "Interview Question"
        label.numberOfLines = 0
        return label
    }()

    let divisionLineSecond: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let seeMore: UILabel = {
        let label = UILabel()
        label.text = "기업정보 더보기"
        label.textColor = .lightGray
        return label
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
        
        [logoPathImageView,
         name,
         rateTotalAvg,
         industryName,
         divisionLineFirst,
         reviewSummary,
         salaryAvgTitle,
         salaryAvg,
         interviewQuestionTitle,
         interviewQuestion,
         divisionLineSecond,
         seeMore].forEach {
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
//            $0.centerX.equalTo(rateTotalAvg.snp.centerX)
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
        
        salaryAvgTitle.snp.makeConstraints {
            $0.top.equalTo(reviewSummary.snp.bottom).offset(32)
            $0.leading.equalToSuperview().offset(16)
        }
        
        salaryAvg.snp.makeConstraints {
            $0.leading.equalTo(salaryAvgTitle.snp.trailing).offset(8)
            $0.bottom.equalTo(salaryAvgTitle.snp.bottom)
            $0.trailing.equalToSuperview().offset(-8)
        }
        
        interviewQuestionTitle.snp.makeConstraints {
            $0.top.equalTo(salaryAvgTitle.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
        }
        
        interviewQuestion.snp.makeConstraints {
            $0.top.equalTo(interviewQuestionTitle.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        divisionLineSecond.snp.makeConstraints {
            $0.top.equalTo(interviewQuestion.snp.bottom).offset(16)
            $0.height.equalTo(1)
            $0.leading.trailing.equalToSuperview()
        }
        
        seeMore.snp.makeConstraints {
            $0.top.equalTo(divisionLineSecond.snp.bottom).offset(8)
            $0.trailing.equalToSuperview().offset(-16)
            $0.bottom.equalToSuperview().offset(-16)
        }
    }
    
    override func setupImplementation() {
        
    }
    
    // MARK:- Methods
    
    
    
}
