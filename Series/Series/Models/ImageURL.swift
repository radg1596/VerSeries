//
//  ImageURL.swift
//  Series
//
//  Created by Ricardo Desiderio on 10/19/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import Foundation

/*
 Cada instancia contiene dos direcciones URL
 medium: Es una imagen pequeña que se descarga rápido
 original: Es una imagen imagen grande, pero es más costosa en tiempo de obtener
 */
struct ImageURL: Codable {
    let medium: String
    let original: String
}
