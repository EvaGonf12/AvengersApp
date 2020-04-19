//
//  BattlesViewModel.swift
//  AvegersApp
//
//  Created by Eva Gonzalez Ferreira on 19/04/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

class BattlesViewModel {
    weak var coordinatorDelegate: BattlesCoordinatorDelegate?
    weak var viewDelegate: BattlesViewDelegate?
    let battlesDataManager: BattlesDataManager
    var battleViewModels: [BattleCellViewModel] = []

    init(battlesDataManager: BattlesDataManager) {
        self.battlesDataManager = battlesDataManager
    }
    
    fileprivate func fetchBattlesAndReloadUI() {
        battlesDataManager.fetchAllBattles { [weak self] (result) in
            self?.battleViewModels = []
            self?.viewDelegate?.battlesFetched()
        }
    }

    func viewWasLoaded() {
        fetchBattlesAndReloadUI()
    }

    func numberOfSections() -> Int {
        return 1
    }

    func numberOfRows(in section: Int) -> Int {
        return battleViewModels.count
    }

    func viewModel(at indexPath: IndexPath) -> BattleViewCell? {
        guard indexPath.row < battleViewModels.count else { return nil }
        return battleViewModels[indexPath.row]
    }

    func didSelectRow(at indexPath: IndexPath) {
        guard indexPath.row < battleViewModels.count else { return }
        coordinatorDelegate?.didSelect(topic: battleViewModels[indexPath.row].topic)
    }

    func plusButtonTapped() {
        coordinatorDelegate?.battlesPlusButtonTapped()
    }

    func newBattleWasCreated() {
        fetchBattlesAndReloadUI()
    }

    func battleWasDeleted() {
        fetchBattlesAndReloadUI()
    }
}

