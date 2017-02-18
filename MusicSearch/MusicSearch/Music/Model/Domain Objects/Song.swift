//
//  Song.swift
//  MusicSearch
//
//  Created by MOSO33 on 2/17/17.
//  Copyright © 2017 JPMC. All rights reserved.
//

import Foundation

public struct Song{
     let trackName: String
     let artistName: String
     let albumName:String
     let imageOfAlbum: String
    
    public init(trackName: String, artistName: String, albumName: String, imageOfAlbum: String) {
        self.trackName = trackName
        self.artistName = artistName
        self.albumName = albumName
        self.imageOfAlbum = imageOfAlbum
    }
}
