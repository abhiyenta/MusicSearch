//
//  Constants.swift
//  MusicSearch
//
//  Created by MOSO33 on 2/17/17.
//  Copyright © 2017 JPMC. All rights reserved.
//

import Foundation

struct Constants {
    struct SongApi {
        static let BaseUrl = "https://itunes.apple.com/search"
    }
    
    struct CellIdentifiers {
        static let SongCellIdentifier = "SongCell"
    }
    
    struct NotifcationIdentifiers {
        static let SongCellClicked = Notification.Name("SongCellClicked")

    }

}
