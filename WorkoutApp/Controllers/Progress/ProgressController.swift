//
//  ProgressController.swift
//  WorkoutApp
//
//  Created by user on 19.05.2023.
//

import UIKit

class ProgressController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Resources.Strings.NavBar.progress
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.getTitle(for: Tabs.progress)
        
        addNavBarButton(at: NavBarPosition.left, with: Resources.Strings.Progress.navBarLeft)
        addNavBarButton(at: NavBarPosition.right, with: Resources.Strings.Progress.navBarRight)
    }

}
