//
//  SerieCollectionViewCell.swift
//  Series
//
//  Created by Ricardo Desiderio on 10/18/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import UIKit

class SerieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var seriePreviewImageView: UIImageView!
    @IBOutlet weak var serieTitleLabel: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!

    override func awakeFromNib() {
        super.awakeFromNib()
        spinner.startAnimating()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        spinner.startAnimating()
        spinner.isHidden = false
        seriePreviewImageView.image = nil
    }
    
    func update(with image: UIImage?) {
        guard let image = image else {return}
        seriePreviewImageView.image = image
        spinner.stopAnimating()
        spinner.isHidden = true
    }
    
    
}
