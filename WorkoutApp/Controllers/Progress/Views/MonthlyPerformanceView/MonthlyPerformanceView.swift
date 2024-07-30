//
//  MonthlyPerformanceView.swift
//  WorkoutApp
//
//  Created by Pavel Lakhno on 28.07.2024.
//

import UIKit

final class MonthlyPerformanceView: WABaseInfoView {
    
    private let chartsView = WAChartsView()
    
    func configure(with items: [WAChartsView.Data]) {
        chartsView.configure(with: items)

    }
}


extension MonthlyPerformanceView {
    override func setupViews() {
        super.setupViews()

        setupView(chartsView)

    }

    override func setupConstraintViews() {
        super.setupConstraintViews()

        NSLayoutConstraint.activate([
            chartsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            chartsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            chartsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            chartsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }

    override func configureAppearance() {
        super.configureAppearance()
    }
}
