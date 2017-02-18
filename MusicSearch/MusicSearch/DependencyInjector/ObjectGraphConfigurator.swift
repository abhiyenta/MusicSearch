//
//  ObjectGraphConfigurator.swift
//  MusicSearch
//
//  Created by MOSO33 on 2/17/17.
//  Copyright © 2017 JPMC. All rights reserved.
//


final class ObjectGraphConfigurator {
    
    // Can't init is singleton
    private init() { }
    
    //MARK: Shared Instance
    
    static let sharedInstance: ObjectGraphConfigurator = ObjectGraphConfigurator()

    
    func songListViewController() -> SongListViewController {
        let songAPI = SongAPIClientRest()
        let songParser = SongParseClientJson()
        let songService = SongService(apiClient: songAPI, parser: songParser)
        let songDataSource = SongListTableDataSource(songs:[])
        
        let songListViewController = SongListViewController()
        songListViewController.songService = songService
        songListViewController.dataSource = songDataSource ;
        return songListViewController 
    }
    
//    func lyricsDetailsViewController() -> SongListViewController {
//        //
//        return songListViewController
//    }
    
}
