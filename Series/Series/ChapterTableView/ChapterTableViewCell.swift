//
//  ChapterTableViewCell.swift
//  Series
//
//  Created by Ricardo Desiderio on 10/20/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import UIKit

class ChapterTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var chapterImageView: UIImageView!
    @IBOutlet weak var chapterNumberLabel: UILabel!
    @IBOutlet weak var descriptionChapterLabel: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        chapterImageView.image = nil
        chapterNumberLabel.text = nil
        descriptionChapterLabel.text = nil
    }
    
    func configureCell(with episode: Chapter) {
        
        chapterNumberLabel.text = "Episode \(episode.number): \(episode.name)"
        if let episodeSummary = episode.summary {
            if !episodeSummary.isEmpty {
                descriptionChapterLabel.text = episode.summary?.clearTags()
                
            }
            descriptionChapterLabel.text = "Summary not available"
        }
        if let urlImage = episode.imageURL?.medium {
            SeriesService.shared.getPhoto(urlString: urlImage) { (image) in
                if let image = image {
                    self.chapterImageView.image = image
                }
            }
        }
        else {
            chapterImageView.image = UIImage(named: "notAvailable")
        }
        
    }

}
