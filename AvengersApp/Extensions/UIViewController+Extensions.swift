//
//  UIViewController+Extensions.swift
//  AvengersApp
//
//  Created by Roberto Garrido on 08/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

// Colors
let colorBlue = UIColor(named: "ColorBlue")
let colorBlueBg = UIColor(named: "ColorBlueBg")
let colorBlueDark = UIColor(named: "ColorBlueDark")
let colorGrayDark = UIColor(named: "ColorGrayDark")
let colorTextDark = UIColor(named: "ColorTextDark")
let coloBgPink = UIColor(named: "ColoBgPink")

extension UIViewController {
    /// Muestra un alertcontroller con una única acción
    /// - Parameters:
    ///   - alertMessage: Mensaje del alert
    ///   - alertTitle: Título del alert
    ///   - alertActionTitle: Título de la acción
    func showAlert(_ alertMessage: String,
                               _ alertTitle: String = NSLocalizedString("Error", comment: ""),
                               _ alertActionTitle: String = NSLocalizedString("OK", comment: "")) {

        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: alertActionTitle, style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
}
