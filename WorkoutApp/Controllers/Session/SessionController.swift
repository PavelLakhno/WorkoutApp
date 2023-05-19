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
        
        title = "High Intensity Cardio"
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.session
        
        addNavBarButton(at: NavBarPosition.left, with: "Pause")
        addNavBarButton(at: NavBarPosition.right, with: "Finish")
    }

}
