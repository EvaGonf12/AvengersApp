//
//  VillainsViewModel.swift
//  AvegersApp
//
//  Created by Eva Gonzalez Ferreira on 19/04/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

class VillainsViewModel {
    weak var coordinatorDelegate: VillainsCoordinatorDelegate?
    weak var viewDelegate: VillainsViewDelegate?
    let villainsDataManager: VillainsDataManager
    var villainsViewModels: [VillainCellViewModel] = []

    init(villainsDataManager: VillainsDataManager) {
        self.villainsDataManager = villainsDataManager
    }
    
    fileprivate func fetchSuperHeroesAndReloadUI() {
        villainsDataManager.fetchAllVillains { [weak self] (result) in
            self?.villainsViewModels = []
            self?.viewDelegate?.villainsFetched()
        }
    }

    func viewWasLoaded() {
        fetchSuperHeroesAndReloadUI()
    }

    func numberOfSections() -> Int {
        return 1
    }

    func numberOfRows(in section: Int) -> Int {
        return villainsViewModels.count
    }

    func viewModel(at indexPath: IndexPath) -> VillainViewCell? {
        guard indexPath.row < villainsViewModels.count else { return nil }
        return villainsViewModels[indexPath.row]
    }

    func didSelectRow(at indexPath: IndexPath) {
        guard indexPath.row < villainsViewModels.count else { return }
        coordinatorDelegate?.didSelect(topic: villainsViewModels[indexPath.row].topic)
    }
}

