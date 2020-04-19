//
//  BattlesCoordinator.swift
//  AvegersApp
//
//  Created by Eva Gonzalez Ferreira on 19/04/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

/// Coordinator que representa la pila de navegación del topics list.
/// Tiene como hijo el AddTopicCoordinator
class BattlesCoordinator: Coordinator {
    let presenter: UINavigationController
    let battlesDataManager: BattlesDataManager
    //let battleDetailDataManager: BattleDetailDataManager
    //let addBattleDataManager: AddBattleDataManager
    var battlesViewModel: BattlesViewModel?

    init(presenter: UINavigationController, battlesDataManager: BattlesDataManager) {

        self.presenter = presenter
        self.battlesDataManager = battlesDataManager
//        self.addBattleDataManager = addBattleDataManager
    }

    override func start() {
        let battlesViewModel = BattlesViewModel(battlesDataManager: battlesDataManager)
        let battlesViewController = BattlesViewController(viewModel: battlesViewModel)
        battlesViewController.title = NSLocalizedString("Battles", comment: "")
        battlesViewModel.viewDelegate = battlesViewController
        battlesViewModel.coordinatorDelegate = self
        self.battlesViewModel = battlesViewModel
        presenter.pushViewController(battlesViewController, animated: false)
    }

    override func finish() {}
}

//extension BattlesCoordinator: BattlesCoordinatorDelegate {
//    func didSelect(battle: Battle) {
//        let topicDetailViewModel = DetailViewModel(topicID: topic.id, topicDetailDataManager: topicDetailDataManager)
//        topicDetailViewModel.coordinatorDelegate = self
//        let topicDetailViewController = TopicDetailViewController(viewModel: topicDetailViewModel)
//        topicDetailViewModel.viewDelegate = topicDetailViewController
//        presenter.pushViewController(topicDetailViewController, animated: true)
//    }
//
//    func battlePlusButtonTapped() {
//        let addBattleCoordinator = AddBattleCoordinator(presenter: presenter, addBattleDataManager: addBattleDataManager)
//        addChildCoordinator(addBattleCoordinator)
//        addBattleCoordinator.start()
//
//        addBattleCoordinator.onCancelTapped = { [weak self] in
//            guard let self = self else { return }
//
//            addBattleCoordinator.finish()
//            self.removeChildCoordinator(addBattleCoordinator)
//        }
//
//        addBattleCoordinator.onBattleCreated = { [weak self] in
//            guard let self = self else { return }
//
//            addBattleCoordinator.finish()
//            self.removeChildCoordinator(addBattleCoordinator)
//            self.battlesViewModel?.newBattleWasCreated()
//        }
//    }
//}

//extension BattlesCoordinator: TopicDetailCoordinatorDelegate {
//    func topicDetailBackButtonTapped() {
//        presenter.popViewController(animated: true)
//    }
//
//    func topicSuccessfullyDeleted() {
//        presenter.popViewController(animated: true)
//        topicsViewModel?.topicWasDeleted()
//    }
//}
