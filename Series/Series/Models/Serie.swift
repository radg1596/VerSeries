//
//  Serie.swift
//  Series
//
//  Created by Ricardo Desiderio on 10/19/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import Foundation

struct Serie: Codable, CustomStringConvertible {

    let id: Int
    let imageURL: ImageURL
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
    
    var description: String {
        return "(id: \(id), imageURL: \(imageURL.medium), name: \(name), summary: \(summary), officialSite: \(officialSite ?? ""), schedule: \(schedule.time) \(schedule.days.map{$0})"
    }
    
}
