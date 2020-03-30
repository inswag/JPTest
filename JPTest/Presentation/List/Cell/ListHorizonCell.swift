//
//  ListHorizonCell.swift
//  JPTest
//
//  Created by Insu Park on 2020/03/28.
//  Copyright © 2020 INSWAG. All rights reserved.
//

import UIKit
import Kingfisher

protocol ListHorizonCellDelegate: class {
    func push(data: Themes)
}

class ListHorizonCell: TableViewCell {

    // MARK:- Properties
    
    var viewModel: ListHorizonCellViewModel!
    weak var delegate: ListHorizonCellDelegate?
    
    // MARK:- UI Properties
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        let cv = UICollectionView(frame: CGRect.zero , collectionViewLayout: layout)
        cv.setCollectionViewLayout(layout, animated: true)
        cv.backgroundColor = .lightGray
        cv.showsHorizontalScrollIndicator = false
        cv.allowsSelection = true
        cv.dataSource = self
        cv.delegate = self
        cv.register(UINib(nibName: "ListHorizonNestedCollectionViewCell", bundle: nil),
                    forCellWithReuseIdentifier: "ListHorizonNestedCell")
        return cv
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
        
        [collectionView].forEach {
            self.addSubview($0)
        }
    }
    
    override func setupUILayout() {
        collectionView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    override func setupImplementation() {
        
    }
    
    // MARK:- Methods
    
    override func prepareForReuse() {
        self.collectionView.reloadData()
    }
    
}

extension ListHorizonCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListHorizonNestedCell", for: indexPath) as? ListHorizonNestedCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.viewModel = ListHorizonNestedCellViewModel(contents: viewModel.themes[indexPath.row])
        return cell
    }
    
}

extension ListHorizonCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = viewModel.themes[indexPath.row]
        delegate?.push(data: data)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16) // 300 - 16 - 16 = 268
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 268)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

//        cv.register(ListHorizonNestedCell.self,
//                    forCellWithReuseIdentifier: String(describing: ListHorizonNestedCell.self))
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ListHorizonNestedCell.self),
//                                                            for: indexPath) as? ListHorizonNestedCell else { return UICollectionViewCell() }
