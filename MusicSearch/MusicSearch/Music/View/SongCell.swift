//
//  SongCell.swift
//  MusicSearch
//
//  Created by MOSO33 on 2/18/17.
//  Copyright © 2017 JPMC. All rights reserved.
//

import Foundation
import UIKit

class SongCell: UITableViewCell {
    
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var albumName: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        configureView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureView() {

    }
    
    //any translation logic related to cell goes here 
    func setSong(song: Song){
        artistName.text = song.artistName
        albumName.text = song.albumName
        trackName.text = song.trackName
        albumImage.getImageFromURL(urlString: song.imageOfAlbum)
    }
}
