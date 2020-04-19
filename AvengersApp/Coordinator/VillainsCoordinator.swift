//
//  VillainsCoordinator.swift
//  AvegersApp
//
//  Created by Eva Gonzalez Ferreira on 19/04/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

/// Coordinator que representa la pila de navegación del topics list.
/// Tiene como hijo el AddTopicCoordinator
class VillainsCoordinator: Coordinator {
    let presenter: UINavigationController
    let villainsDataManager: VillainsDataManager
    //let battleDetailDataManager: BattleDetailDataManager
    //let addBattleDataManager: AddBattleDataManager
    var villainsViewModel: VillainsViewModel?

    init(presenter: UINavigationController, villainsDataManager: VillainsDataManager) {

        self.presenter = presenter
        self.villainsDataManager = villainsDataManager
//        self.addBattleDataManager = addBattleDataManager
    }

    override func start() {
        let villainsViewModel = VillainsViewModel(villainsDataManager: villainsDataManager)
        let villainsViewController = VillainsViewController(viewModel: villainsViewModel)
        villainsViewController.title = NSLocalizedString("Villains", comment: "")
        villainsViewModel.viewDelegate = villainsViewController
        villainsViewModel.coordinatorDelegate = self
        self.villainsViewModel = villainsViewModel
        presenter.pushViewController(villainsViewController, animated: false)
    }

    override func finish() {}
}
