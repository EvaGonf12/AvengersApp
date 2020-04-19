//
//  AppCoordinator.swift
//  AvengersApp
//
//  Created by Roberto Garrido on 01/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

/// Coordinator principal de la app. Encapsula todas las interacciones con la Window.
/// Tiene dos hijos, el topic list, y el categories list (uno por cada tab)
class AppCoordinator: Coordinator {
    let sessionAPI = SessionAPI()

    lazy var remoteDataManager: AvengersAppRemoteDataManager = {
        let remoteDataManager = AvengersAppRemoteDataManagerImpl(session: sessionAPI)
        return remoteDataManager
    }()

    lazy var localDataManager: AvengersAppLocalDataManager = {
        let localDataManager = AvengersAppLocalDataManagerImpl()
        return localDataManager
    }()

    lazy var dataManager: AvengersAppDataManager = {
        let dataManager = AvengersAppDataManager(localDataManager: self.localDataManager, remoteDataManager: self.remoteDataManager)
        return dataManager
    }()

    let window: UIWindow
    init(window: UIWindow) {
        self.window = window
    }

    override func start() {
        let tabBarController = UITabBarController()

        let villainsNavigationController = UINavigationController()
        let villainsCoordinator = VillainsCoordinator(presenter: villainsNavigationController,
                                                  villainsDataManager: dataManager,
                                                  villainDetailDataManager: dataManager)
        //addChildCoordinator(topicsCoordinator)
       // topicsCoordinator.start()

        tabBarController.tabBar.tintColor = .black
        tabBarController.viewControllers = [villainsNavigationController]
        tabBarController.tabBar.items?.first?.image = UIImage()

        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }

    override func finish() {}
}
