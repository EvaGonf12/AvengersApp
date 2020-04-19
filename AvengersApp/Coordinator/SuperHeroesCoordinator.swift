//
//  TopicsCoordinator.swift
//  AvengersApp
//
//  Created by Roberto Garrido on 08/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

/// Coordinator que representa la pila de navegación del topics list.
/// Tiene como hijo el AddTopicCoordinator
class SuperHeroesCoordinator: Coordinator {
    let presenter: UINavigationController
    let superHeroesDataManager: SuperHeroesDataManager
    //let battleDetailDataManager: BattleDetailDataManager
    //let addBattleDataManager: AddBattleDataManager
    var bsuperHeroesViewModel: SuperHeroesViewModel?

    init(presenter: UINavigationController, superHeroesDataManager: SuperHeroesDataManager) {

        self.presenter = presenter
        self.superHeroesDataManager = superHeroesDataManager
//        self.addBattleDataManager = addBattleDataManager
    }

    override func start() {
        let superHeroesViewModel = SuperHeroesViewModel(battlesDataManager: superHeroesDataManager)
        let superHeroesViewController = SuperHeroesViewController(viewModel: superHeroesViewModel)
        superHeroesViewController.title = NSLocalizedString("SuperHeroes", comment: "")
        superHeroesViewModel.viewDelegate = superHeroesViewController
        superHeroesViewModel.coordinatorDelegate = self
        self.superHeroesViewModel = superHeroesViewModel
        presenter.pushViewController(superHeroesViewController, animated: false)
    }

    override func finish() {}
}
