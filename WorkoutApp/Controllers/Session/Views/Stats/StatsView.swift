//
//  StatsView.swift
//  WorkoutApp
//
//  Created by user on 05.06.2023.
//

import UIKit

final class StatsView: WABaseInfoView {

    private let itemView = StatsItemView()
    
}

extension StatsView {
    override func setupViews() {
        super.setupViews()

        setupView(itemView)
        
        itemView.configure(with: StatsItemView.StatsItem(
            image: Resources.Images.Session.Stats.heartRate,
            value: "155 bps",
            title: Resources.Strings.Session.heartRate.uppercased()
        ))
    }

    override func setupConstraintViews() {
        super.setupConstraintViews()

        NSLayoutConstraint.activate([
            itemView.topAnchor.constraint(equalTo: topAnchor, constant: 45),
            itemView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15)
        ])
    }

    override func configureAppearance() {
        super.configureAppearance()
    }
}
