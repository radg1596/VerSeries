//
//  SerieIntermediate.swift
//  Series
//
//  Created by Ricardo Desiderio on 10/19/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import Foundation

//Es una estructura intermedia que nos permite seleccionar las series del JSON que traemos de la direccion base al realizar la consulta
struct SerieIntermediate: Codable {
    let serie: Serie
    enum CodingKeys: String, CodingKey {
        case serie = "show"
    }
}
