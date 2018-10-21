//
//  DetailSerieViewController.swift
//  Series
//
//  Created by Ricardo Desiderio on 10/20/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import UIKit

class DetailSerieViewController: UIViewController {
    

    @IBOutlet weak var serieImageView: UIImageView!
    @IBOutlet weak var nameTextLabel: UILabel!
    @IBOutlet weak var summaryTextView: UITextView!
    @IBOutlet weak var transmitterTextLabel: UILabel!
    @IBOutlet weak var webSiteButton: UIButton!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var daysTextLabel: UILabel!
    
    var serie: Serie!

    override func viewDidLoad() {
        super.viewDidLoad()
        summaryTextView.isEditable = false
        print(serie)
        configureUI()
        // Do any additional setup after loading the view.
    }
    
    func configureUI() {
        
        nameTextLabel.text = serie.name
        summaryTextView.text = serie.summary.clearTags()
        transmitterTextLabel.text = serie.network?.name ?? "Not available"
        webSiteButton.setTitle(serie.officialSite, for: .normal)
        hourLabel.text = serie.schedule.time
        daysTextLabel.text = dayListToString(days: serie.schedule.days)
        SeriesService.shared.getPhoto(urlString: serie.imageURL.original) { (image) in
            if let image = image {
                self.serieImageView.image = image
            }
        }
        
    }
    
    func dayListToString(days: [String]) -> String {
        return days.reduce("", {$0 + $1 + " "})
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
