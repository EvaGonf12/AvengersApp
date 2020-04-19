//
//  BattleViewCell.swift
//  AvegersApp
//
//  Created by Eva Gonzalez Ferreira on 19/04/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

class BattleViewCell: UIViewController {

    @IBOutlet weak var battleTitle: UILabel!
    @IBOutlet weak var villainImage: UIImageView!
    @IBOutlet weak var superheroImage: UIImageView!
    
    var viewModel: BattleCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            battleTitle.text = viewModel.battleTitle
            villainImage.image = UIImage(named: viewModel.villainImage)
            superheroImage.image = UIImage(named: viewModel.superheroImage)
        }
    }

}
