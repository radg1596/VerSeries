//
//  ChapterTableViewDataSource.swift
//  Series
//
//  Created by Ricardo Desiderio on 10/20/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import UIKit

class ChapterTableViewDataSource: UIViewController,  UITableViewDataSource {
    
    var episodes: [Chapter] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "chapterCell") as! ChapterTableViewCell
        
        let episode = episodes[indexPath.row]
        cell.configureCell(with: episode)
        /*
        cell.chapterNumberLabel.text = "Episode \(episode.number)"
        cell.descriptionChapterLabel.text = episode.summary?.clearTags() ?? "Not available"
        
        if let urlImage = episode.imageURL?.medium {
            SeriesService.shared.getPhoto(urlString: urlImage) { (image) in
                if let image = image {
                    cell.chapterImageView.image = image
                }
            }
        }*/

        
        return cell
    }
    
    
}
