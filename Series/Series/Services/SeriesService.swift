//
//  SeriesService.swift
//  Series
//
//  Created by Ricardo Desiderio on 10/20/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import Foundation
import UIKit

//Servicios de Serie
struct SeriesService {
    
    static let shared = SeriesService()
    let jsonDecoder = JSONDecoder()
    
    /*Recibe una Url y closure
     Le pasa al closure la imagen (si pudo obtenerla, sino nil) y lo ejecuta en el hilo principal
     */
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
    /*Recibe una query y closure
     Le pasa al closure una lista de objetos "Serie" (si pudo obtenerla, sino nil) y lo ejecuta en el hilo principal
     Ejemplo de query: "girls"
     */
    func getSeries(query: String, completion: @escaping ([Serie]?) -> Void) {
        ClientAPI.shared.getData(endPoint: .search(query: query)) { (data) in
            if let intermediateModel = try? self.jsonDecoder.decode(Array<SerieIntermediate>.self, from: data) {
                let series = intermediateModel.map({$0.serie})
                DispatchQueue.main.async { completion(series) }
            }
            else {
                print("We can not decode the data")
                DispatchQueue.main.async {completion (nil) }
            }
        }
    }
    
    /*Recibe el id de una serie y closure
     Le pasa al closure una lista de episodios (si pudo obtenerla, sino nil) y lo ejecuta en el hilo principal
     */
    
    func getEpisodes(serieID: String, completion: @escaping ([Episode]?) -> Void) {
        ClientAPI.shared.getData(endPoint: .episodes(serieID: serieID)) { (data) in
            if let episodes = try? self.jsonDecoder.decode(Array<Episode>.self, from: data) {
                DispatchQueue.main.async { completion(episodes) }
            }
            else { DispatchQueue.main.async { completion (nil) } }
        }
    }
    
}
