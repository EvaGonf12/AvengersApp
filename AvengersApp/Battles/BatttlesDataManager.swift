//
//  BatttlesDataManager.swift
//  AvegersApp
//
//  Created by Eva Gonzalez Ferreira on 19/04/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

/// Data Manager con las opraciones necesarias de este módulo
protocol BattlesDataManager {
    func fetchAllBattles(completion: @escaping ([String]) -> ())
}
