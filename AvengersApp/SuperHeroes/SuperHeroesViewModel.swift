//
//  SuperHeroesViewModel.swift
//  AvegersApp
//
//  Created by Eva Gonzalez Ferreira on 19/04/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

class SuperHeroesViewModel {
    weak var coordinatorDelegate: SuperHeroesCoordinatorDelegate?
    weak var viewDelegate: SuperHeroesViewDelegate?
    let superHeroesDataManager: SuperHeroesDataManager
    var superHeroesViewModels: [SuperHeroeCellViewModel] = []

    init(superHeroesDataManager: SuperHeroesDataManager) {
        self.superHeroesDataManager = superHeroesDataManager
    }
    
    fileprivate func fetchSuperHeroesAndReloadUI() {
        superHeroesDataManager.fetchAllSuperHeroes { [weak self] (result) in
            self?.superHeroesViewModels = []
            self?.viewDelegate?.superHeroesFetched()
        }
    }

    func viewWasLoaded() {
        fetchSuperHeroesAndReloadUI()
    }

    func numberOfSections() -> Int {
        return 1
    }

    func numberOfRows(in section: Int) -> Int {
        return superHeroesViewModels.count
    }

    func viewModel(at indexPath: IndexPath) -> BattleViewCell? {
        guard indexPath.row < superHeroesViewModels.count else { return nil }
        return superHeroesViewModels[indexPath.row]
    }

    func didSelectRow(at indexPath: IndexPath) {
        guard indexPath.row < superHeroesViewModels.count else { return }
        coordinatorDelegate?.didSelect(topic: superHeroesViewModels[indexPath.row].topic)
    }

    func newBattleWasCreated() {
        fetchSuperHeroesAndReloadUI()
    }

    func battleWasDeleted() {
        fetchSuperHeroesAndReloadUI()
    }
}

