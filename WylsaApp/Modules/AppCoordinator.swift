//
// Created by Dmitrii Space on 2019-07-12.
// Copyright (c) 2019 Dmitrii Space. All rights reserved.
//

import UIKit

class AppCoordinator {

    private let appDependency: AppDependency
    private let window: UIWindow
    private lazy var tabBarController = UITabBarController()
    private lazy var navigationControllers = AppCoordinator.makeNavigationControllers()

    init(window: UIWindow, appDependency: AppDependency) {
        self.window = window
        self.appDependency = appDependency
        self.setupAppearance()
    }

    func start() {
        self.setupFeed()
        self.setupPrize()
        let navigationControllers = NavControllerType.allCases.compactMap {
            self.navigationControllers[$0]
        }
        self.tabBarController.setViewControllers(navigationControllers, animated: true)
        self.window.rootViewController = self.tabBarController
        self.window.makeKeyAndVisible()
    }
}

private extension AppCoordinator {
    func setupFeed() {
        guard let navController = self.navigationControllers[.feed] else {
            fatalError("can't find navController")
        }
        let context = FeedContext(moduleDependencies: self.appDependency,
                                  moduleOutput: nil)
        let container = FeedContainer.assemble(with: context)
        navController.setViewControllers([container.viewController], animated: false)
        container.viewController.navigationItem.title = NavControllerType.feed.title
    }

    func setupPrize() {
        guard let navController = self.navigationControllers[.prize] else {
            fatalError("can't find navController")
        }
        let viewController = UIViewController()
        viewController.view.backgroundColor = .brown
        navController.setViewControllers([viewController], animated: false)
        viewController.navigationItem.title = NavControllerType.prize.title
    }

    func setupAppearance() {
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().tintColor = .black

        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .white

            UINavigationBar.appearance().tintColor = .black
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        } else {
            UINavigationBar.appearance().tintColor = .black
            UINavigationBar.appearance().barTintColor = .purple
            UINavigationBar.appearance().isTranslucent = false
        }
        UINavigationBar.appearance().shadowImage = UIImage()

        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]

        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().tintColor = Styles.Color.appGreen
    }

    static func makeNavigationControllers() -> [NavControllerType: UINavigationController] {
        var result: [NavControllerType: UINavigationController] = [:]
        NavControllerType.allCases.forEach { navControllerKey in
            let navigationController = UINavigationController()
            let tabBarItem = UITabBarItem(title: navControllerKey.title,
                                          image: navControllerKey.image,
                                          tag: navControllerKey.rawValue)
            navigationController.tabBarItem = tabBarItem
            navigationController.navigationBar.prefersLargeTitles = true
            result[navControllerKey] = navigationController
        }
        return result
    }
}

fileprivate enum NavControllerType: Int, CaseIterable {
    case feed, prize, video, thumbsUp, podcasts

    var title: String {
        switch self {
        case .feed:
            return Localization.feed
        case .prize:
            return Localization.prize
        case .video:
            return Localization.video
        case .thumbsUp:
            return Localization.thumbsUp
        case .podcasts:
            return Localization.podcasts
        }
    }

    var image: UIImage? {
        switch self {
        case .feed:
            return UIImage(named: "feed")
        case .prize:
            return UIImage(named: "prize")
        case .video:
            return UIImage(named: "video")
        case .thumbsUp:
            return UIImage(named: "thumbsUp")
        case .podcasts:
            return UIImage(named: "podcasts")
        }
    }
}