//
//  DetailSerieViewController.swift
//  Series
//
//  Created by Ricardo Desiderio on 10/20/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import UIKit
import SafariServices

class DetailSerieViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var spinnerImageView: UIActivityIndicatorView!
    @IBOutlet weak var serieImageView: UIImageView!
    @IBOutlet weak var nameTextLabel: UILabel!
    @IBOutlet weak var summaryTextView: UITextView!
    @IBOutlet weak var transmitterTextLabel: UILabel!
    @IBOutlet var webSiteButton: UIButton!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var daysTextLabel: UILabel!
    @IBOutlet weak var episodesTableView: UITableView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var serie: Serie!
    let episodesTableViewDataSource =  EpisodeTableViewDataSource()
    
    let pickerViewController = PickerViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        summaryTextView.isEditable = false
        episodesTableView.dataSource = episodesTableViewDataSource
        //Picker
        pickerView.delegate = pickerViewController
        pickerView.dataSource = pickerViewController
        //UI
        configureUI()
    }
    
    func configureUI() {
        //Congigurando la segunda vista con los datos de la serie
        nameTextLabel.text = serie.name
        summaryTextView.text = serie.summary.clearTags()
        transmitterTextLabel.text = serie.network?.name ?? "Not available"
        webSiteButton.setTitle(serie.officialSite, for: .normal)
        hourLabel.text = serie.schedule.time
        daysTextLabel.text = dayListToString(days: serie.schedule.days)
        spinnerImageView.startAnimating()
        SeriesService.shared.getPhoto(urlString: serie.imageURL?.original ?? "null") { (image) in
            if let image = image {
                self.serieImageView.image = image
              self.spinnerImageView.stopAnimating()
                self.spinnerImageView.isHidden = true
            }
        }
        //Obteniendo episodios de la primera temporada
        SeriesService.shared.getEpisodes(serieID: "\(serie.id)") { (episodes) in
            if let episodes = episodes {
                //Picker
                var seasons = episodes.map({"\($0.season)"})
                let episodesS1 = episodes.filter({$0.season == 1})
                seasons = Array(Set(seasons))
                self.pickerViewController.seasons = seasons.sorted()
                self.pickerView.reloadAllComponents()
                //Tabla
                self.episodesTableViewDataSource.episodes = episodesS1
                self.episodesTableView.reloadData()
            }
        }
        
        
    }
    
    /*Recibe una lista de dias y retorna su concatenación como string
     */
    func dayListToString(days: [String]) -> String {
        return days.reduce("", {$0 + $1 + " "})
    }

    
    //Carga los capitulos de la temporada seleccionada
    @IBAction func showSeason(_ sender: Any) {
        let season = pickerView.selectedRow(inComponent: 0) + 1
        SeriesService.shared.getEpisodes(serieID: "\(serie.id)") { (episodes) in
            if let episodes = episodes {
                let episodesOfSeason = episodes.filter({ $0.season == season })
                self.episodesTableViewDataSource.episodes = episodesOfSeason
                self.episodesTableView.reloadData()
            }
        }
    }
    
    //Se carga el WebSite de la serie
    @IBAction func showWebSite(_ sender: UIButton) {
        guard let urlString = serie.officialSite, let url = URL(string: urlString ) else {return}
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true, completion: nil)
        
    }

}
