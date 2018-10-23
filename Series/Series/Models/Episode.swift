//
//  Episode.swift
//  Series
//
//  Created by Ricardo Desiderio on 10/20/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import Foundation

/*Abstracción de un episodio como objeto
 Cuenta con:
 -nombre
 -resumen del episodio
 -dirección url de imágenes (Strig)
 -número de episodio
 -número de temporada
 */

struct Episode: Codable {
    
    let name: String
    let summary: String?
    let imageURL: ImageURL?
    let number: Int
    let season: Int
    
    enum CodingKeys: String, CodingKey {
        case name
        case summary
        case imageURL = "image"
        case number
        case season
    }
}
