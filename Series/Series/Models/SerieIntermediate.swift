//
//  SerieIntermediate.swift
//  Series
//
//  Created by Ricardo Desiderio on 10/19/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import Foundation

struct SerieIntermediate: Codable {
    let serie: Serie
    enum CodingKeys: String, CodingKey {
        case serie = "show"
    }
}
