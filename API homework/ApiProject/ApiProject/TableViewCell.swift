//
//  TableViewCell.swift
//  ApiProject
//
//  Created by Асель Калиева on 27.02.2023.
//

import UIKit
import SDWebImage

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var artWorkImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setData(music: ITunesMusic){
        artistNameLabel.text = music.artistName
        trackNameLabel.text = music.trackName
        
        artWorkImageView.sd_setImage(with: URL(string: music.artworkURL))
    }

}

