//
//  StepsView.swift
//  WorkoutApp
//
//  Created by user on 08.06.2023.
//

import UIKit

final class StepsView: WABaseInfoView {

    private let barsView = WABarsView()
    
    func configure(with items: [WABarView.Data]) {
        barsView.configure(with: items)

    }
}


extension StepsView {
    override func setupViews() {
        super.setupViews()

        setupView(barsView)

    }

    override func setupConstraintViews() {
        super.setupConstraintViews()

        NSLayoutConstraint.activate([
            barsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            barsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            barsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            barsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }

    override func configureAppearance() {
        super.configureAppearance()
    }
}

