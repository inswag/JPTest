//
//  Navigator.swift
//  JPTest
//
//  Created by Insu Park on 2020/03/23.
//  Copyright © 2020 INSWAG. All rights reserved.
//

import UIKit

class Navigator {
    
    enum Scene {
        case list
        
        case companyDetail(data: JobPlanet)
        case horizonDetail(data: Themes)
        case jobPostingDetail(data: JobPlanet)
        case reviewDetail(data: JobPlanet)
        case salaryDetail(data: JobPlanet)
        case interviewDetail(data: JobPlanet)
    }
    
    func get(segue: Scene) -> UIViewController {
        switch segue {
        case .list:
            let viewModel = ListViewControllerViewModel()
            let list = ListViewController(navigator: self, viewModel: viewModel)
            let naviList = UINavigationController(rootViewController: list)
            return naviList
        case .companyDetail(let data):
            let company = CompanyDetailViewController(data: data)
            company.modalPresentationStyle = .fullScreen
            return company
        case .horizonDetail(let data):
            let horizon = HorizonDetailViewController(data: data)
            horizon.modalPresentationStyle = .fullScreen
            return horizon
        case .jobPostingDetail(let data):
            let jobPosting = JobPostingDetailViewController(data: data)
            jobPosting.modalPresentationStyle = .fullScreen
            return jobPosting
        case .reviewDetail(let data):
            let review = ReviewDetailViewController(data: data)
            review.modalPresentationStyle = .fullScreen
            return review
        case .salaryDetail(let data):
            let salary = SalaryDetailViewController(data: data)
            salary.modalPresentationStyle = .fullScreen
            return salary
        case .interviewDetail(let data):
            let interview = InterviewDetailViewController(data: data)
            interview.modalPresentationStyle = .fullScreen
            return interview
        }
    }
    
    
}

