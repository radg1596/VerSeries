//
//  SeriesPreviewDataSource.swift
//  Series
//
//  Created by Ricardo Desiderio on 10/18/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import UIKit

/*
 Se encarga de proveer información al collectionView
 a partir de una lista de objetos "Serie"
 */

class SeriesPreviewDataSource: NSObject, UICollectionViewDataSource {
    
    var series: [Serie] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return series.count
    }
    
    //Utiliza un tipo de Celda llamado serieCell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "serieCell", for: indexPath) as! SerieCollectionViewCell
        
        let serie = series[indexPath.row]
        
        cell.serieTitleLabel.text = serie.name
        cell.currentURLImage = serie.imageURL?.medium ?? "null"
        cell.update(with: serie.imageURL?.medium ?? "null")
        
        return cell
    }
    
    
    
}
