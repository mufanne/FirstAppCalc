//
//  ITunesMusic.swift
//  ApiProject
//
//  Created by Асель Калиева on 27.02.2023.
//

import Foundation
import SwiftyJSON

struct ITunesMusic {
    var trackName = ""
    var artistName = ""
    var artworkURL = ""
    var previewUrl = ""
    
    init(){
        
    }
    
    init(json: JSON) {
        if let item = json["artistName"].string{
            artistName = item
        }
        if let item = json["trackName"].string{
            trackName = item
        }
        if let item = json["artworkUrl100"].string{
            artworkURL = item
        }
        if let item = json["previewUrl"].string{
            previewUrl = item
        }
    }
    
}
