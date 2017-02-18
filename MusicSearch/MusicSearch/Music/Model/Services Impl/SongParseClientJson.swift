//
//  SongParseClientJson.swift
//  MusicSearch
//
//  Created by MOSO33 on 2/18/17.
//  Copyright © 2017 JPMC. All rights reserved.
//

import Foundation

class SongParseClientJson: SongParserProtocol{
    
    func songsFromJSON(JSON: Array<Any>) -> [Song]{
        var songs:[Song] = []
        if let songsArray = JSON as? [[String:Any]] {
            for songDict in songsArray {
                
                guard let trackName = songDict["trackName"] as? String  else {
                    continue
                }
                guard let artistName = songDict["artistName"] as? String else {
                    continue
                }
                guard let albumName = songDict["collectionName"] as? String else {
                    continue
                }
                guard let imageOfAlbum = songDict["collectionName"] as? String else {
                    continue
                }
                let song = Song(trackName: trackName, artistName: artistName, albumName: albumName, imageOfAlbum: imageOfAlbum)
                songs.append(song) ;
            }
        }
        return songs
    }
}
