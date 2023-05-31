//
//  SessionController.swift
//  WorkoutApp
//
//  Created by user on 19.05.2023.
//

import UIKit

class SessionController: BaseController {

    private let timerView = TimerView()

    private let timerDuration = 3614.0
    
    override func navBarLeftButtonHandler() {
        if timerView.state == .isStopped {
            timerView.startTimer()
        } else {
            timerView.pauseTimer()
        }
        
        timerView.state = timerView.state == .isRuning ? .isStopped : .isRuning
        setTitleForNavBarButton(
            timerView.state == .isRuning
            ? Resources.Strings.Session.navBarPause : Resources.Strings.Session.navBarStart,
            at: .left)
    }
    
    override func navBarRightButtonHandler() {
        timerView.stopTimer()
        timerView.state = .isStopped
        
        setTitleForNavBarButton(Resources.Strings.Session.navBarStart, at: .left)
    }

}

extension SessionController {
    override func setupViews() {
        super.setupViews()
        
        view.setupView(timerView)
    }
    
    override func setupConstraintViews() {
        super.setupConstraintViews()
        
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            //timerView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        title = Resources.Strings.NavBar.session
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.getTitle(for: Tabs.session)
        
        addNavBarButton(at: NavBarPosition.left, with: Resources.Strings.Session.navBarStart)
        addNavBarButton(at: NavBarPosition.right, with: Resources.Strings.Session.navBarFinish)
        
        timerView.configure(with: timerDuration, progress: 0)
    }
}
