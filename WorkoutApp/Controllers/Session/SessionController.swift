//
//  SessionController.swift
//  WorkoutApp
//
//  Created by user on 19.05.2023.
//

import UIKit

class SessionController: BaseController {

    private let timerView: BaseInfoView = {
        let view = BaseInfoView(with: "Test", alignment: .center)
        
        return view
    }()


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
            timerView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        title = Resources.Strings.NavBar.session
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.getTitle(for: Tabs.session)
        
        addNavBarButton(at: NavBarPosition.left, with: Resources.Strings.Session.navBarLeft)
        addNavBarButton(at: NavBarPosition.right, with: Resources.Strings.Session.navBarRight)
    }
}
