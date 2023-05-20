//
//  OverviewController.swift
//  WorkoutApp
//
//  Created by user on 18.05.2023.
//

import UIKit

class OverviewController: BaseController {
    private let allWorkoutButton = SecondaryButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension OverviewController {
    override func addViews() {
        super.addViews()
        
        view.addSubview(allWorkoutButton)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            allWorkoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            allWorkoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            allWorkoutButton.heightAnchor.constraint(equalToConstant: 28),
            allWorkoutButton.widthAnchor.constraint(equalToConstant: 130)
        ])
    }
    
    override func configure() {
        super.configure()
        
        allWorkoutButton.translatesAutoresizingMaskIntoConstraints = false
        allWorkoutButton.setTitle(Resources.Strings.Overview.allWorkoutsButton)
        allWorkoutButton.addTarget(
            self,
            action: #selector(allWorkoutsButtonAction),
            for: .touchUpInside
        )
    }
}

extension OverviewController {
    @objc func allWorkoutsButtonAction() {
        print("All workouts button tapped")
    }
}
