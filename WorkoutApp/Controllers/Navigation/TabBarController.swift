//
//  TabBarController.swift
//  WorkoutApp
//
//  Created by user on 18.05.2023.
//

import UIKit

enum Tabs: Int, CaseIterable {
    case overview
    case session
    case progress
    case settings
}

final class TabBarController: UITabBarController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        configureAppearance()
        switchTo(tab: .session)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureAppearance()
    }

    func switchTo(tab: Tabs) {
        selectedIndex = tab.rawValue
    }

    private func configureAppearance() {
        tabBar.tintColor = Resources.Colors.active
        tabBar.barTintColor = Resources.Colors.inactive
        tabBar.backgroundColor = .white
        tabBar.layer.borderColor = Resources.Colors.separator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        let controllers: [NavBarController] = Tabs.allCases.map { tab in
            let controller = NavBarController(rootViewController: getController(for: tab))
            controller.tabBarItem = UITabBarItem(
                title: Resources.Strings.TabBar.getTitle(for: tab),
                image: Resources.Images.TabBar.getIcon(for: tab),
                tag: tab.rawValue
            )
            return controller
        }
        
        setViewControllers(controllers, animated: false)
    }
        
    private func getController(for tab: Tabs) -> BaseController {
        switch tab {
        case .overview: return OverviewController()
        case .progress: return ProgressController()
        case .session: return SessionController()
        case .settings: return SettingsController()
        }
    }
//        let overviewController = OverviewController()
//        let sessionController = SessionController()
//        let progressController = ProgressController()
//        let settingsController = SettingsController()
//
//        let overviewNavigation = NavBarController(rootViewController: overviewController)
//        let sessionNavigation = NavBarController(rootViewController: sessionController)
//        let progressNavigation = NavBarController(rootViewController: progressController)
//        let settingsNavigation = NavBarController(rootViewController: settingsController)
//
//        overviewController.tabBarItem = UITabBarItem(
//            title: Resources.Strings.TabBar.overview,
//            image: Resources.Images.TabBar.overview,
//            tag: Tabs.overview.rawValue
//        )
//
//        sessionController.tabBarItem = UITabBarItem(
//            title: Resources.Strings.TabBar.session,
//            image: Resources.Images.TabBar.session,
//            tag: Tabs.session.rawValue
//        )
//
//        progressNavigation.tabBarItem = UITabBarItem(
//            title: Resources.Strings.TabBar.progress,
//            image: Resources.Images.TabBar.progress,
//            tag: Tabs.progress.rawValue
//        )
//
//        settingsNavigation.tabBarItem = UITabBarItem(
//            title: Resources.Strings.TabBar.settings,
//            image: Resources.Images.TabBar.settings,
//            tag: Tabs.settings.rawValue
//        )
//
//        setViewControllers([
//            overviewNavigation,
//            sessionNavigation,
//            progressNavigation,
//            settingsNavigation
//        ], animated: false)


}
