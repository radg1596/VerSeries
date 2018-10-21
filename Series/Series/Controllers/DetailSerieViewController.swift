//
//  DetailSerieViewController.swift
//  Series
//
//  Created by Ricardo Desiderio on 10/20/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import UIKit

class DetailSerieViewController: UIViewController {
    
    @IBOutlet weak var spinnerImageView: UIActivityIndicatorView!
    @IBOutlet weak var serieImageView: UIImageView!
    @IBOutlet weak var nameTextLabel: UILabel!
    @IBOutlet weak var summaryTextView: UITextView!
    @IBOutlet weak var transmitterTextLabel: UILabel!
    @IBOutlet weak var webSiteButton: UIButton!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var daysTextLabel: UILabel!
    @IBOutlet weak var episodesTableView: UITableView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var serie: Serie!
    let episodesTableViewDataSource =  ChapterTableViewDataSource()
    
    let pickerViewController = PickerViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        summaryTextView.isEditable = false
        episodesTableView.dataSource = episodesTableViewDataSource
        print(serie)
        configureUI()
        // Do any additional setup after loading the view.
        //Picker
        pickerView.delegate = pickerViewController
        pickerView.dataSource = pickerViewController
    }
    
    func configureUI() {
        
        nameTextLabel.text = serie.name
        summaryTextView.text = serie.summary.clearTags()
        transmitterTextLabel.text = serie.network?.name ?? "Not available"
        webSiteButton.setTitle(serie.officialSite, for: .normal)
        hourLabel.text = serie.schedule.time
        daysTextLabel.text = dayListToString(days: serie.schedule.days)
        spinnerImageView.startAnimating()
        SeriesService.shared.getPhoto(urlString: serie.imageURL.original) { (image) in
            if let image = image {
                self.serieImageView.image = image
              self.spinnerImageView.stopAnimating()
                self.spinnerImageView.isHidden = true
            }
        }

        //Tabla
        SeriesService.shared.getChapters(serieID: "\(serie.id)") { (chapters) in
            if let chapters = chapters {
                //Picker
                var seasons = chapters.map({"\($0.season)"})
                seasons = Array(Set(seasons))
                self.pickerViewController.seasons = seasons.sorted()
                self.pickerView.reloadAllComponents()
            }
        }
        
        
    }
    
    func dayListToString(days: [String]) -> String {
        return days.reduce("", {$0 + $1 + " "})

    }

    
    @IBAction func showSeason(_ sender: Any) {
        let season = pickerView.selectedRow(inComponent: 0) + 1
        SeriesService.shared.getChapters(serieID: "\(serie.id)") { (chapters) in
            if let chapters = chapters {
                let chaptersOfSeason = chapters.filter({ $0.season == season })
                self.episodesTableViewDataSource.episodes = chaptersOfSeason
                self.episodesTableView.reloadData()
            }
        }
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
