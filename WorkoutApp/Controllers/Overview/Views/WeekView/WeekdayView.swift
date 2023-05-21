//
//  WeekdayView.swift
//  WorkoutApp
//
//  Created by Павел Лахно on 21.05.2023.
//

import UIKit

extension WeekView {
    final class WeekdayView: BaseView {
        private let nameLabel = UILabel()
        private let dateLabel = UILabel()
        private let stackView = UIStackView()
    }
}

extension WeekView.WeekdayView {
    override func addViews() {
        super.addViews()
        
        addView(stackView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    override func configure() {
        super.configure()
        backgroundColor = .red
        stackView.spacing = 3
        stackView.axis = .vertical
    }
}
