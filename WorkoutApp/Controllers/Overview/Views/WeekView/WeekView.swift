//
//  WeekView.swift
//  WorkoutApp
//
//  Created by Павел Лахно on 21.05.2023.
//

import UIKit

final class WeekView: BaseView {
    private let calendar = Calendar.current
    private let stackView = UIStackView()
}

extension WeekView {
    override func addViews() {
        super.addViews()
        
        addView(stackView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configure() {
        super.configure()
        
        stackView.spacing = 7
        stackView.distribution = .fillEqually
        
        let weekdays = calendar.standaloneWeekdaySymbols
        
        weekdays.forEach() { _ in
            let view = WeekdayView()
            stackView.addArrangedSubview(view)
        }
    }
}
