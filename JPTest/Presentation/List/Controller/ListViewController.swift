//
//  ViewController.swift
//  JPTest
//
//  Created by Insu Park on 2020/03/23.
//  Copyright © 2020 INSWAG. All rights reserved.
//

import UIKit
import SnapKit

class ListViewController: ViewController, ListHorizonCellDelegate {

    // MARK:- Properties
    
    let navigator: Navigator
    let viewModel: ListViewControllerViewModel
    
    // MARK:- UI Properties
    
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: UIScreen.main.bounds,
                             style: UITableView.Style.plain)
        tv.allowsSelection = true
        tv.backgroundColor = .white
        tv.separatorStyle = .none
        tv.dataSource = self
        tv.delegate = self
        tv.register(ListHorizonCell.self,
                    forCellReuseIdentifier: String(describing: ListHorizonCell.self))
        tv.register(ListReviewCell.self,
                    forCellReuseIdentifier: String(describing: ListReviewCell.self))
        tv.register(UINib(nibName: "ListCompanyTableViewCell", bundle: nil),
                    forCellReuseIdentifier: "ListCompanyCell")
        tv.register(UINib(nibName: "ListJobPostingTableViewCell", bundle: nil),
                    forCellReuseIdentifier: "ListJobPostingCell")
        tv.register(UINib(nibName: "ListSalaryTableViewCell", bundle: nil),
                    forCellReuseIdentifier: "ListSalaryCell")
        tv.register(UINib(nibName: "ListInterviewTableViewCell", bundle: nil),
        forCellReuseIdentifier: "ListInterviewCell")
        return tv
    }()
    
    // MARK:- Initialize
    
    init(navigator: Navigator, viewModel: ListViewControllerViewModel) {
        self.navigator = navigator
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

    // MARK:- UI Methods
    
    override func setupUIComponents() {
        self.view.backgroundColor = .white
        [tableView].forEach {
            self.view.addSubview($0)
        }
    }
    
    override func setupUILayout() {
        tableView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    override func setupImplementation() {
        
    }
    
    // MARK:- Methods
    
    func requestData() {
        viewModel.fetchDataList {
            self.tableView.reloadData()
        }
    }
    
    func push(data: Themes) {
        let vc = self.navigator.get(segue: .horizonDetail(data: data))
        self.navigationController?.pushViewController(vc, animated: true)
    }

   
}

// MARK:- Table View Data Source

extension ListViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rawData = viewModel.fetchedDataList[indexPath.row]
        
        switch viewModel.fetchedDataList[indexPath.row].cellType {
        case ListViewControllerViewModel.CellType.company.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListCompanyCell",
                                                           for: indexPath) as? ListCompanyTableViewCell else { return UITableViewCell() }
            cell.viewModel = ListCompanyCellViewModel(contents: rawData)
            return cell
        case ListViewControllerViewModel.CellType.horizontalTheme.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ListHorizonCell.self),
                                                           for: indexPath) as? ListHorizonCell  else { return UITableViewCell() }
            guard let themes = rawData.themes else { return UITableViewCell() }
            cell.viewModel = ListHorizonCellViewModel(themes: themes)
            cell.delegate = self
            return cell
        case ListViewControllerViewModel.CellType.jobPosting.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListJobPostingCell",
                                                           for: indexPath) as? ListJobPostingTableViewCell else { return UITableViewCell() }
            cell.viewModel = ListJobPostingCellViewModel(contents: rawData)
            return UITableViewCell()
        case ListViewControllerViewModel.CellType.review.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ListReviewCell.self),
                                                           for: indexPath) as? ListReviewCell  else { return UITableViewCell() }
            cell.viewModel = ListReviewCellViewModel(contents: rawData)
            return cell
        case ListViewControllerViewModel.CellType.salary.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListSalaryCell",
                                                           for: indexPath) as? ListSalaryTableViewCell else { return UITableViewCell() }
            cell.viewModel = ListSalaryCellViewModel(contents: rawData)
            return cell
        case ListViewControllerViewModel.CellType.interview.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListInterviewCell",
                                                           for: indexPath) as? ListInterviewTableViewCell else { return UITableViewCell() }
            cell.viewModel = ListInterviewCellViewModel(contents: rawData)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
}

// MARK:- Table View Delegate

extension ListViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch viewModel.fetchedDataList[indexPath.row].cellType {
        case ListViewControllerViewModel.CellType.company.rawValue,
             ListViewControllerViewModel.CellType.review.rawValue,
             ListViewControllerViewModel.CellType.salary.rawValue,
             ListViewControllerViewModel.CellType.interview.rawValue:
            return UITableView.automaticDimension
        case ListViewControllerViewModel.CellType.horizontalTheme.rawValue:
            return 300
        case ListViewControllerViewModel.CellType.interview.rawValue:
            return 100
        case ListViewControllerViewModel.CellType.jobPosting.rawValue:
            return 168
        default:
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = viewModel.fetchedDataList[indexPath.row]
        
        switch viewModel.fetchedDataList[indexPath.row].cellType {
        case ListViewControllerViewModel.CellType.company.rawValue:
            let companyDetail = navigator.get(segue: .companyDetail(data: data))
            self.navigationController?.pushViewController(companyDetail, animated: true)
        case ListViewControllerViewModel.CellType.review.rawValue:
            let reviewDetail = navigator.get(segue: .reviewDetail(data: data))
            self.navigationController?.pushViewController(reviewDetail, animated: true)
        case ListViewControllerViewModel.CellType.salary.rawValue:
            let salaryDetail = navigator.get(segue: .salaryDetail(data: data))
            self.navigationController?.pushViewController(salaryDetail, animated: true)
        case ListViewControllerViewModel.CellType.interview.rawValue:
            let interviewDetail = navigator.get(segue: .interviewDetail(data: data))
            self.navigationController?.pushViewController(interviewDetail, animated: true)
        case ListViewControllerViewModel.CellType.horizontalTheme.rawValue:
            self.push(data: data.themes![0])
        case ListViewControllerViewModel.CellType.jobPosting.rawValue:
            let jobPostingDetail = navigator.get(segue: .jobPostingDetail(data: data))
            self.navigationController?.pushViewController(jobPostingDetail, animated: true)
        default:
            print("OK")
        }
    }
    
    
    
}


// MARK:- Temporary

//guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ListCompanyCell.self), for: indexPath) as? ListCompanyCell else { return UITableViewCell() }
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ListJobPostingCell.self),
//                                                           for: indexPath) as? ListJobPostingCell  else { return UITableViewCell() }
//        tv.register(ListCompanyCell.self,
//                    forCellReuseIdentifier: String(describing: ListCompanyCell.self))
//        tv.register(ListJobPostingCell.self,
//                    forCellReuseIdentifier: String(describing: ListJobPostingCell.self))
//        tv.register(ListSalaryCell.self,
//                    forCellReuseIdentifier: String(describing: ListSalaryCell.self))

//        tv.register(ListInterviewCell.self,
//                    forCellReuseIdentifier: String(describing: ListInterviewCell.self))
