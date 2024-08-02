//
//  OverviewController.swift
//  WorkoutApp
//
//  Created by user on 18.05.2023.
//

import UIKit

class OverviewController: BaseController {
    
    private let navBar = OverviewNavBar()
    private let header = SectionHeaderView()
}

extension OverviewController {
    override func setupViews() {
        super.setupViews()
        
        view.setupView(navBar)
        view.setupView(header)
    }
    
    override func setupConstraintViews() {
        super.setupConstraintViews()
        
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            header.topAnchor.constraint(equalTo: navBar.bottomAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -16),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),
            header.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        header.configure(with: "test string")
        
        navigationController?.navigationBar.isHidden = true
    }
}


