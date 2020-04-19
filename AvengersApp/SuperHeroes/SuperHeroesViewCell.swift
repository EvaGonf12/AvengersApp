//
//  SuperHeroesViewCell.swift
//  AvegersApp
//
//  Created by Eva Gonzalez Ferreira on 19/04/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

class SuperHeroesViewCell: UIViewController {

    @IBOutlet weak var superheroImage: UIImageView!
    @IBOutlet weak var superheroName: UILabel!
    @IBOutlet weak var superheroPower: UIImageView!
    
    var viewModel: SuperHeroCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            superheroName.text = viewModel.superheroName
            superheroImage.image = UIImage(named: viewModel.superheroImage)
            superheroPower.image = UIImage(named: viewModel.superheroPower)
        }
    }
}

