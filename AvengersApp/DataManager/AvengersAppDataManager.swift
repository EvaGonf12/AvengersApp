//
//  AvengersAppDataManager.swift
//  AvengersApp
//
//  Created by Roberto Garrido on 01/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation


/// DataManager de la app. Usa un localDataManager y un remoteDataManager que colaboran entre ellos
/// En las extensiones de abajo, encontramos la implementación de aquellos métodos necesarios en cada módulo de la app
/// Este DataManager sólo utiliza llamadas remotas, pero podría extenderse para serialziar las respuestas, y poder implementar un offline first en el futuro
class AvengersAppDataManager {
    let localDataManager: AvengersAppLocalDataManager
    let remoteDataManager: AvengersAppRemoteDataManager

    init(localDataManager: AvengersAppLocalDataManager, remoteDataManager: AvengersAppRemoteDataManager) {
        self.localDataManager = localDataManager
        self.remoteDataManager = remoteDataManager
    }
}
//
extension AvengersAppDataManager: BattlesDataManager {
    func fetchAllBattles(completion: @escaping ([String]) -> ()) {
        localDataManager.fetchAllBattles(completion: completion)
    }
}

