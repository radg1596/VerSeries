//
//  EpisodeTableViewCell.swift
//  Series
//
//  Created by Ricardo Desiderio on 10/21/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var episodeNumberLabel: UILabel!
    @IBOutlet weak var episodeSummaryLabel: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    //Preparamos la celda para reutilizarla
    override func prepareForReuse() {
        super.prepareForReuse()
        episodeImageView.image = nil
        episodeNumberLabel.text = nil
        episodeSummaryLabel.text = nil
    }
    
    /*
     Recibe un episodio y retorna una episodeCell
     Se encarga de configurar la celda
     */
    func configureCell(with episode: Episode) {
        //Número y nombre de episodio
        episodeNumberLabel.text = "Episode \(episode.number): \(episode.name)"
        //Nos aseguramos de que el resumen de episodio no esté vacio o nulo
        if let episodeSummary = episode.summary {
            if !episodeSummary.isEmpty {
                episodeSummaryLabel.text = episode.summary?.clearTags()
            }
            else {
                episodeSummaryLabel.text = "Summary not available"
            }
        }
        else {
            episodeSummaryLabel.text = "Summary not available"
        }
        //Configuramos la imagen del episodio, si no puede obtenerse entonces le ponemos una por default, que indique que no está disponible
        if let urlImage = episode.imageURL?.medium {
            SeriesService.shared.getPhoto(urlString: urlImage) { (image) in
                if let image = image {
                    self.episodeImageView.image = image
                }
            }
        }
        else {
            episodeImageView.image = UIImage(named: "notAvailable")
        }
        
    }

}
