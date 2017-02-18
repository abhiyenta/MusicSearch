//
//  SongListViewController.swift
//  MusicSearch
//
//  Created by MOSO33 on 2/18/17.
//  Copyright © 2017 JPMC. All rights reserved.
//

/**
 @description Various seperation of concerns(networking, parsing, translation,...etc) are moved into seperated classes ot keep controller light/thin
 */

import Foundation
import UIKit

class SongListViewController: UIViewController, UISearchBarDelegate
{
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource:SongListTableDataSourceProtocol? = nil
    var songService:SongService? = nil
    
    // MARK: - View lifecycle
    
    override func viewDidLoad(){
        super.viewDidLoad()
        let nibName = UINib(nibName: Constants.CellIdentifiers.SongCellIdentifier, bundle:nil)
        self.tableView.register(nibName, forCellReuseIdentifier: Constants.CellIdentifiers.SongCellIdentifier)

        searchBar.delegate = self
        self.tableView.delegate = dataSource ;
        self.tableView.dataSource = dataSource ;
        observeCellClickNotification() ; //delegates/closures also could be considered here
    }
    
    
    //# MARK: - notifcation observe/remove
    func observeCellClickNotification() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.pushLyricsController),
            name: Constants.NotifcationIdentifiers.SongCellClicked,
            object: nil)
    }
    
    func removeObserverForCellClickNotification() {
        NotificationCenter.default.removeObserver(self, name: Constants.NotifcationIdentifiers.SongCellClicked, object: nil)
    }
    
    //# MARK: - Lyrics controller push
    func pushLyricsController(notification:Notification){
        if let song = notification.object{
            
        }
    }
    
    //# MARK: - Search Bar Methods
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchTerm = searchBar.text{
            fetchSongs(searchTerm: searchTerm)
        }
    }

    //# MARK: - Fetch from Song service
    func fetchSongs(searchTerm: String){
        songService?.fetchSongs(searchTerm:  searchTerm) { serviceResult in
            switch serviceResult {
            case let .success(songs):
                DispatchQueue.main.async(){
                    self.dataSource?.setSongs(songs: songs)
                    self.tableView.reloadData()
                    self.searchBar.text = ""
                    self.searchBar.resignFirstResponder()
                }
            case .error(SongServiceError.noSongsAvailable):
                print("No songs available")
            default:
                print("Other error")
            }
        }
    }
}
 
