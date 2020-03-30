//
//  HorizonDetailViewController.swift
//  JPTest
//
//  Created by Insu Park on 2020/03/29.
//  Copyright © 2020 INSWAG. All rights reserved.
//

import UIKit

class HorizonDetailViewController: ViewController {

    // MARK:- Properties
    
    let data: Themes
    
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
    
    let myTitle: UILabel = {
        let label = UILabel()
        label.text = "공범모집\n공범모집\n공범모집"
        label.textAlignment = .center
        label.numberOfLines = 3
        return label
    }()
    
    // MARK:- Initialize
    
    init(data: Themes) {
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
        
        [coverImageView,
         containerView].forEach {
            self.view.addSubview($0)
        }
        
        [myTitle].forEach {
            self.view.addSubview($0)
        }
    }
    
    override func setupUILayout() {
        coverImageView.snp.makeConstraints {
            $0.width.height.equalTo(180)
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(16)
            $0.leading.equalToSuperview().offset(16)
        }
        
        containerView.snp.makeConstraints {
            $0.leading.equalTo(coverImageView.snp.leading)
            $0.trailing.equalTo(coverImageView.snp.trailing)
            $0.top.equalTo(coverImageView.snp.bottom)
            $0.width.equalTo(180)
            $0.height.equalTo(100)
        }
        
        myTitle.snp.makeConstraints {
            $0.top.equalTo(coverImageView.snp.bottom).offset(8)
            $0.leading.equalTo(containerView.snp.leading).offset(8)
            $0.trailing.equalTo(containerView.snp.trailing).offset(-8)
            $0.bottom.equalTo(containerView.snp.bottom).offset(-8)
        }
    }
    
    override func setupImplementation() {
        let imageURL = URL(string: data.coverImage)
        coverImageView.kf.setImage(with: imageURL)
        myTitle.text = data.title
    }
    
}
