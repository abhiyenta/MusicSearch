//
//  SongListTableDataSource.swift
//  MusicSearch
//
//  Created by MOSO33 on 2/18/17.
//  Copyright © 2017 JPMC. All rights reserved.
//

import Foundation
import UIKit

class SongListTableDataSource: NSObject, SongListTableDataSourceProtocol
{
    private var songs:[Song]
    
    init(songs: [Song]) {
        self.songs = songs
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return songs.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SongCell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.SongCellIdentifier, for: indexPath as IndexPath) as! SongCell
        cell.setSong(song: songs[indexPath.row])
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return 1
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        print(songs[indexPath.row])
    }
    
    func setSongs(songs: [Song]) {
        self.songs = songs
    }
    
    func addSongs(songs: [Song]) {
        self.songs += songs
    }
}
