//
//  ClientAPI.swift
//  Series
//
//  Created by Ricardo Desiderio on 10/19/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import Foundation

enum APIEndPoint{
    case search(query: String)
    case episodes(serieID: String)
    
    func path() -> String {
        switch self {
        case .search (let query):
            return "/search/shows?q=" + query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        case .episodes (let id):
            return "/shows/\(id)/episodes"
        }
    }
}

/*
 Está clase se encarga de generar el url con el URLBase y el parámetro query recibido, y obtener los datos
 */
struct ClientAPI {
    
    let baseURLString = "https://api.tvmaze.com"
    
    static let shared = ClientAPI()
    
    /*
     Recibe un query como parametro y un closure
     Concatena el query con la url base y obtiene los datos a partir de ella
     Le pasa los datos al closure, regresando al hilo principal
     */
    func getData(endPoint: APIEndPoint, completion: @escaping (Data) -> Void ) {
        let urlString = baseURLString + endPoint.path()
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                DispatchQueue.main.async {completion(data)}
            }
        }
        task.resume()
    }
    
}
