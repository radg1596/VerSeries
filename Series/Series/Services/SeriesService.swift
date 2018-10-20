//
//  SeriesService.swift
//  Series
//
//  Created by Ricardo Desiderio on 10/20/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import Foundation
import UIKit

struct SeriesService {
    
    static let shared = SeriesService()
    let jsonDecoder = JSONDecoder()
    
    func getPhoto(urlString: String, completion: @escaping (UIImage?) -> Void) {
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async { completion(image) }
            }
            else {
                print("We can not get the preview image")
                DispatchQueue.main.async{ completion(nil) }
            }
        }
        task.resume()
    }
    
    func getSeries(query: String, completion: @escaping ([Serie]?) -> Void) {
        ClientAPI.shared.getData(endPoint: .search(query: query)) { (data) in
            if let intermediateModel = try? self.jsonDecoder.decode(Array<SerieIntermediate>.self, from: data) {
                let series = intermediateModel.map({$0.serie})
                DispatchQueue.main.async { completion(series) }
            }
            else { DispatchQueue.main.async {completion (nil) } }
        }
    }
    
    func getChapters(serieID: String, completion: @escaping ([Chapter]?) -> Void) {
        ClientAPI.shared.getData(endPoint: .episodes(serieID: serieID)) { (data) in
            if let chapters = try? self.jsonDecoder.decode(Array<Chapter>.self, from: data) {
                DispatchQueue.main.async { completion(chapters) }
            }
            else { DispatchQueue.main.async { completion (nil) } }
        }
    }
    
}
