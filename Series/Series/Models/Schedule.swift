//
//  Schedule.swift
//  Series
//
//  Created by Ricardo Desiderio on 10/19/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import Foundation
/*Agenda de la serie
 Contiene la hora en String, y un arreglo de días (de String)
 */
struct Schedule: Codable {
    let days: [String]
    let time: String
}
