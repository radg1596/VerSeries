//
//  SeriesPreviewDataSource.swift
//  Series
//
//  Created by Ricardo Desiderio on 10/18/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import UIKit

class SeriesPreviewDataSource: NSObject, UICollectionViewDataSource {
    
    var series: [Serie] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return series.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "serieCell", for: indexPath) as! SerieCollectionViewCell
        
        let serie = series[indexPath.row]
        
        cell.serieTitleLabel.text = serie.name
        SeriesService.shared.getPhoto(urlString: serie.imageURL.medium) { (image) in
            cell.update(with: image)
        }
        
        return cell
    }
    
    
}
