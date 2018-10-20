//
//  SeriesPreviewViewController.swift
//  Series
//
//  Created by Ricardo Desiderio on 10/18/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import UIKit

class SeriesPreviewViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let seriesPreviewDataSource = SeriesPreviewDataSource()
    let numberOfColumns: CGFloat = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = seriesPreviewDataSource
        
        //Configurando para tener 3 columnas
        if let collectionViewFlowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            let cellWidth = (view.frame.width * 0.96 ) / numberOfColumns
            collectionViewFlowLayout.itemSize.width = cellWidth
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
