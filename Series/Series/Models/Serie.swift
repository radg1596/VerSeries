//
//  Serie.swift
//  Series
//
//  Created by Ricardo Desiderio on 10/19/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import Foundation

/*Abstracción de una serie como objeto
 Contiene:
 -id
 -urls de imagen
 -nombre
 -resumen
 -agenda
 -su network, es decir compañía
 -URL del sitio oficial
 */
struct Serie: Codable {

    let id: Int
    let imageURL: ImageURL?
    let name: String
    let summary: String
    let schedule: Schedule
    let network: Network?
    let officialSite: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "image"
        case name
        case summary
        case network
        case schedule
        case officialSite
    }
    
}
