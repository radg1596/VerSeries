//
//  PickerViewController.swift
//  Series
//
//  Created by Ricardo Desiderio on 10/20/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import UIKit

/*
 Este controllador se encarga de que el picker siempre tenga
 el total de temporadas de cada serie
 El arreglo "seasons" contiene todas las temporadas:
 ejemplo: seasons = ["1", "2", "3"]
 */

class PickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var seasons: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return seasons.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return seasons[row]
    }

}
