//
//  SeriesPreviewViewController.swift
//  Series
//
//  Created by Ricardo Desiderio on 10/18/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import UIKit

class SeriesPreviewViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var notSeriesLabel: UILabel!
    
    let seriesPreviewDataSource = SeriesPreviewDataSource()
    
    let numberOfColumns: CGFloat = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = seriesPreviewDataSource
        collectionView.delegate = self
        
        
        //Configurando para tener 3 columnas
        if let collectionViewFlowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            let cellWidth = (view.frame.width * 0.96 ) / numberOfColumns
            let cellheight = (view.frame.height * 0.96 ) / numberOfColumns
            collectionViewFlowLayout.itemSize.width = cellWidth
            collectionViewFlowLayout.itemSize.height = cellheight
        }

    }
    

    @IBAction func textFieldChanged(_ sender: UITextField, forEvent event: UIEvent) {
                
        notSeriesLabel.isHidden = true
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let query = searchTextField.text ?? ""
        SeriesService.shared.getSeries(query: query) { (series) in
            if let series = series, series.isEmpty == false {
                self.seriesPreviewDataSource.series = series
            }
            else {
                self.seriesPreviewDataSource.series = []
                self.notSeriesLabel.isHidden = false
            }
            self.collectionView.reloadData()
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPathSelected = collectionView.indexPathsForSelectedItems?.first else {return}
        let serie = seriesPreviewDataSource.series[indexPathSelected.row]
        
        let destionationVC = segue.destination as? DetailSerieViewController
        destionationVC?.serie = serie
    }
    
    

}
