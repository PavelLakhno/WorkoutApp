//
//  SessionController.swift
//  WorkoutApp
//
//  Created by user on 19.05.2023.
//

import UIKit

class SessionController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Resources.Strings.NavBar.session
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.session
        
        addNavBarButton(at: NavBarPosition.left, with: Resources.Strings.Session.navBarLeft)
        addNavBarButton(at: NavBarPosition.right, with: Resources.Strings.Session.navBarRight)
    }

}
