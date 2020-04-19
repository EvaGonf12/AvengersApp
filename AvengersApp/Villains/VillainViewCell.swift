//
//  VillainsViewCell.swift
//  AvegersApp
//
//  Created by Eva Gonzalez Ferreira on 19/04/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

class VillainViewCell: UIViewController {

    @IBOutlet weak var villainImage: UIImageView!
    @IBOutlet weak var villainName: UILabel!
    @IBOutlet weak var villainPower: UIImageView!
    
    var viewModel: VillainCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            villainName.text = viewModel.villainName
            villainImage.image = UIImage(named: viewModel.villainImage)
            villainPower.image = UIImage(named: viewModel.villainPower)
        }
    }

}
