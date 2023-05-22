//
//  OverviewNavBar.swift
//  WorkoutApp
//
//  Created by user on 20.05.2023.
//

import UIKit

final class OverviewNavBar: BaseView {
    
    private let titleLabel = UILabel()
    private let allWorkoutButton = SecondaryButton()
    private let addButton = UIButton()
    private let weekView = WeekView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addBottomBorder(with: Resources.Colors.separator, height: 1)
    }
    
    func addAllWorkoutsAction(_ action: Selector, with target: Any?) {
        allWorkoutButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func additingAction(_ action: Selector, with target: Any?) {
        addButton.addTarget(target, action: action, for: .touchUpInside)
    }

}

extension OverviewNavBar {
    override func setupViews() {
        super.setupViews()
        
        addView(titleLabel)
        addView(allWorkoutButton)
        addView(addButton)
        addView(weekView)
        
    }
    
    override func setupConstraintViews() {
        super.setupConstraintViews()
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            addButton.heightAnchor.constraint(equalToConstant: 28),
            addButton.widthAnchor.constraint(equalToConstant: 28),
            
            allWorkoutButton.topAnchor.constraint(equalTo: addButton.topAnchor),
            allWorkoutButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -15),
            allWorkoutButton.heightAnchor.constraint(equalToConstant: 28),
            allWorkoutButton.widthAnchor.constraint(equalToConstant: 130),
            
            titleLabel.centerYAnchor.constraint(equalTo: allWorkoutButton.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: allWorkoutButton.leadingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            weekView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 15),
            weekView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            weekView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            weekView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            weekView.heightAnchor.constraint(equalToConstant: 47)
        ])
  
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = .white

        titleLabel.text = Resources.Strings.NavBar.overview
        titleLabel.textColor = Resources.Colors.titleGray
        titleLabel.font = Resources.Fonts.helvelticaRegular(with: 22)

        allWorkoutButton.setTitle(Resources.Strings.Overview.allWorkoutsButton)

        addButton.setImage(Resources.Images.Common.add, for: .normal)

    }
}

