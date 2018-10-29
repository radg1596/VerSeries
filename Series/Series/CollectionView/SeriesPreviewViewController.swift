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
    let textFieldDelegate = TextFieldDelegate()
    let numberOfColumns: CGFloat = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Tabla de series
        collectionView.dataSource = seriesPreviewDataSource
        collectionView.delegate = self
        //TextField
        searchTextField.delegate = textFieldDelegate
        //Collection
        adjustColectionViewColumns()
    }
    
    func adjustColectionViewColumns() {
        //Configurando para tener 3 columnas, para que en cualquier dispostivo se vean 3 columnas
        if let collectionViewFlowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            let cellWidth = (view.frame.width * 0.96 ) / numberOfColumns
            let cellheight = (view.frame.height * 0.96 ) / numberOfColumns
            collectionViewFlowLayout.itemSize.width = cellWidth
            collectionViewFlowLayout.itemSize.height = cellheight
        }
    }
    

    /*
     Cuando el textField de búsqueda es editado, entonces se vuelven a obtener las series y se recarga la información de la tabla
     */
    @IBAction func textFieldChanged(_ sender: UITextField, forEvent event: UIEvent) {
        notSeriesLabel.isHidden = true
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let query = searchTextField.text ?? "null"
        SeriesService.shared.getSeries(query: query) { (series) in
            if let series = series, series.isEmpty == false {
                self.seriesPreviewDataSource.series = series
                self.notSeriesLabel.isHidden = true
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

    //  Le envía a la siguiente vista la serie que el usuario a seleccionado del collectionView
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPathSelected = collectionView.indexPathsForSelectedItems?.first else {return}
        let serie = seriesPreviewDataSource.series[indexPathSelected.row]
        
        let destionationVC = segue.destination as? DetailSerieViewController
        destionationVC?.serie = serie
    }
    
    //Es para que el se oculte el teclado
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchTextField.resignFirstResponder()
    }
    
}
