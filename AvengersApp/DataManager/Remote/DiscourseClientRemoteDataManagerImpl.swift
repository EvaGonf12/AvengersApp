//
//  AvengersAppRemoteDataManagerImpl.swift
//  AvengersApp
//
//  Created by Roberto Garrido on 01/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

/// Implementación por defecto del protocolo remoto, en este caso usando SessionAPI
class AvengersAppRemoteDataManagerImpl: AvengersAppRemoteDataManager {
    let session: SessionAPI

    init(session: SessionAPI) {
        self.session = session
    }
}
