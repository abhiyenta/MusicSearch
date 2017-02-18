//
//  Song.swift
//  MusicSearch
//
//  Created by MOSO33 on 2/17/17.
//  Copyright © 2017 JPMC. All rights reserved.
//

import Foundation

public struct Song{
    private let artist: String
    private let songTitle: String
    private let lyrics:String
    private let url: String
    
    public init(artist: String, songTitle: String, lyrics: String, url: String) {
        self.artist = artist
        self.songTitle = songTitle
        self.lyrics = lyrics
        self.url = url
    }
}
