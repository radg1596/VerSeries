//
//  EpisodeTableViewDataSource.swift
//  Series
//
//  Created by Ricardo Desiderio on 10/21/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import UIKit


/*Se encarga de proverle datos (Usa un array de episodios) a la tabla de episodios de la segunda vista
 Utiliza un tipo de celda especial llamado "episodeCell"
 */
class EpisodeTableViewDataSource: UIViewController, UITableViewDataSource {

    var episodes: [Episode] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell") as! EpisodeTableViewCell
        let episode = episodes[indexPath.row]
        //Configure the cell...
        cell.configureCell(with: episode)
        
        return cell
    }
    

}
