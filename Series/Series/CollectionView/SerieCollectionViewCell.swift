//
//  SerieCollectionViewCell.swift
//  Series
//
//  Created by Ricardo Desiderio on 10/18/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import UIKit

/*
 Celda especial de una serie, para usar en el collectionView
 */

class SerieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var seriePreviewImageView: UIImageView!
    @IBOutlet weak var serieTitleLabel: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!

    var currentURLImage: String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        spinner.startAnimating()
    }
    //Reutilizar
    override func prepareForReuse() {
        super.prepareForReuse()
        spinner.startAnimating()
        spinner.isHidden = false
        seriePreviewImageView.image = nil
    }
    
    //Recibe una imagen y configura la celda
    func update(with urlImage: String) {
        SeriesService.shared.getPhoto(urlString: urlImage) { (image) in
            guard let image = image, urlImage == self.currentURLImage else {return}
            self.seriePreviewImageView.image = image
            self.spinner.stopAnimating()
            self.spinner.isHidden = true
        }
    }
    
    
    
}
