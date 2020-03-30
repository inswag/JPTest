//
//  JobPostingDetailViewController.swift
//  JPTest
//
//  Created by Insu Park on 2020/03/29.
//  Copyright © 2020 INSWAG. All rights reserved.
//

import UIKit

class JobPostingDetailViewController: ViewController {

    // MARK:- Properties
    
    let data: JobPlanet
    
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
    
    let mytitle: UILabel = {
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
    
    let reviewAvgCache: UILabel = {
        let label = UILabel()
        label.text = "0.0"
        label.textColor = .black
        label.textAlignment = .right
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.companyName,
                                                       self.mytitle,
                                                       self.message])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
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
        
        [logoImageView,
         stackView,
         containerView].forEach {
            self.view.addSubview($0)
        }
        
        [starImageView, reviewAvgCache].forEach {
            self.containerView.addSubview($0)
        }
    }
    
    override func setupUILayout() {
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(16)
            $0.leading.equalTo(16)
            $0.width.height.equalTo(90)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.top)
            $0.leading.equalTo(logoImageView.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(90)
        }
        
        containerView.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(16)
            $0.centerX.equalTo(logoImageView.snp.centerX)
            $0.width.equalTo(80)
            $0.height.equalTo(25)
        }
        
        starImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().offset(8)
            $0.width.height.equalTo(15)
        }
        
        reviewAvgCache.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-8)
        }
        
    }
    
    override func setupImplementation() {
        let imageURL = URL(string: data.logo!)
        logoImageView.kf.setImage(with: imageURL)
        companyName.text = data.companyName
        reviewAvgCache.text = "\(data.reviewAvgCache!)"
        mytitle.text = data.title
        message.text = data.deadline?.message
    }
    
}
