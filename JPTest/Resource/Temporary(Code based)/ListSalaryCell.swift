//
//  ListSalaryCell.swift
//  JPTest
//
//  Created by Insu Park on 2020/03/29.
//  Copyright © 2020 INSWAG. All rights reserved.
//

import UIKit
import Kingfisher

class ListSalaryCell: TableViewCell {

    // MARK:- Properties

    var viewModel: ListSalaryCellViewModel! {
        didSet {
            let imageURL = URL(string: viewModel.logoPath!)
            logoPathImageView.kf.setImage(with: imageURL)

            name.text = viewModel.name
            rateTotalAvg.text = "별 \(viewModel.rateTotalAvg!)"
            industryName.text = viewModel.industryName

            
            salaryAvg.text = "\(viewModel.salaryAvg!) 만원"
            salaryLowest.text = "\(viewModel.salaryLowest!)"
            salaryHighest.text = "\(viewModel.salaryHighest!)"
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
        label.textColor = .yellow
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
    
    let salaryLowestTitle: UILabel = {
        let label = UILabel()
        label.text = "최저"
        label.textColor = .lightGray
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    let salaryHighestTitle: UILabel = {
        let label = UILabel()
        label.text = "최고"
        label.textColor = .lightGray
        label.numberOfLines = 1
        label.textAlignment = .right

        return label
    }()
    
    let progressView: UIProgressView = {
        let pgView = UIProgressView()
        pgView.progressTintColor = UIColor.white
        pgView.trackTintColor = UIColor.rgb(r: 0, g: 0, b: 10, a: 0.36)
        return pgView
    }()
    
    let salaryLowest: UILabel = {
        let label = UILabel()
        label.text = "0,000"
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    
    let salaryHighest: UILabel = {
        let label = UILabel()
        label.text = "30,000"
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .right
        return label
    }()

    let divisionLineSecond: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let seeMore: UILabel = {
        let label = UILabel()
        label.text = "연봉정보 더보기"
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
         salaryAvgTitle,
         salaryAvg,
         salaryLowestTitle,
         salaryLowest,
         salaryHighestTitle,
         salaryHighest,
         progressView,
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
        
        salaryAvgTitle.snp.makeConstraints {
            $0.top.equalTo(divisionLineFirst.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(150)
        }
        
        salaryAvg.snp.makeConstraints {
            $0.top.equalTo(salaryAvgTitle.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(150)
        }
        
        salaryLowestTitle.snp.makeConstraints {
            $0.top.equalTo(salaryAvgTitle.snp.top)
            $0.leading.equalTo(salaryAvgTitle.snp.trailing).offset(48)
        }
        
        progressView.snp.makeConstraints {
            $0.top.equalTo(salaryLowestTitle.snp.bottom)
            $0.leading.equalTo(salaryLowestTitle.snp.leading)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(3)
        }
        
        salaryLowest.snp.makeConstraints {
            $0.top.equalTo(progressView.snp.bottom).offset(8)
            $0.leading.equalTo(salaryLowestTitle.snp.leading)
        }
        
        salaryHighestTitle.snp.makeConstraints {
            $0.top.equalTo(salaryAvgTitle.snp.top)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        salaryHighest.snp.makeConstraints {
            $0.top.equalTo(progressView.snp.bottom).offset(8)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        divisionLineSecond.snp.makeConstraints {
            $0.top.equalTo(salaryAvg.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
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

