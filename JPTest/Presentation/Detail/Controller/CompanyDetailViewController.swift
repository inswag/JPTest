//
//  DetailViewController.swift
//  JPTest
//
//  Created by Insu Park on 2020/03/23.
//  Copyright © 2020 INSWAG. All rights reserved.
//

import UIKit

class CompanyDetailViewController: ViewController {
    
    // MARK:- Properties
    
    let data: JobPlanet
    
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
    
    let containerView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 15
        return view
    }()
    
    let starImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "default_star")
        return iv
    }()
    
    let rateTotalAvg: UILabel = {
        let label = UILabel()
        label.text = "0.0"
        label.textColor = .black
        label.textAlignment = .right
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
    
    init(data: JobPlanet) {
        self.data = data
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    // MARK:- UI Methods
    
    override func setupUIComponents() {
        self.view.backgroundColor = .white
        
        [logoPathImageView,
         name,
         containerView,
         industryName,
         divisionLineFirst,
         reviewSummary,
         salaryAvgTitle,
         salaryAvg,
         interviewQuestionTitle,
         interviewQuestion,
         divisionLineSecond,
         seeMore].forEach {
            self.view.addSubview($0)
        }
        
        [starImageView,
         rateTotalAvg].forEach {
            self.containerView.addSubview($0)
        }
    }
    
    override func setupUILayout() {
        logoPathImageView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(16)
            $0.leading.equalTo(16)
            $0.width.height.equalTo(90)
        }
        
        name.snp.makeConstraints {
            $0.top.equalTo(logoPathImageView.snp.top)
            $0.leading.equalTo(logoPathImageView.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        containerView.snp.makeConstraints {
            $0.bottom.equalTo(logoPathImageView.snp.bottom)
            $0.leading.equalTo(logoPathImageView.snp.trailing).offset(16)
            $0.width.equalTo(80)
            $0.height.equalTo(25)
        }
        
        starImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().offset(8)
            $0.width.height.equalTo(15)
        }
        
        rateTotalAvg.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-8)
        }
        
        industryName.snp.makeConstraints {
            $0.top.equalTo(rateTotalAvg.snp.top)
            //            $0.centerX.equalTo(rateTotalAvg.snp.centerX)
            $0.leading.equalTo(rateTotalAvg.snp.trailing).offset(16)
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
        }
    }
    
    override func setupImplementation() {
        print("data : ", self.data)
        
        let url = URL(string: self.data.logoPath!)
        self.logoPathImageView.kf.setImage(with: url)
        
        name.text = data.name
        rateTotalAvg.text = "\(data.rateTotalAvg!)"
        industryName.text = data.industryName

        reviewSummary.text = data.reviewSummary
        salaryAvg.text = "\(data.salaryAvg!) 만원"
        interviewQuestion.text = data.interviewQuestion
    }
    
}



