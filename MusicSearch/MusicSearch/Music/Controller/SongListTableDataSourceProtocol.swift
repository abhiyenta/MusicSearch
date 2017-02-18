//
//  SongListTableDataSourceProtocol.swift
//  MusicSearch
//
//  Created by MOSO33 on 2/18/17.
//  Copyright © 2017 JPMC. All rights reserved.
//

import Foundation
import UIKit

/**
 @description Encapsulates cell creation logic of UIViewController. Keeping viewcontrollers light
 */

protocol SongListTableDataSourceProtocol: UITableViewDelegate, UITableViewDataSource {
    func setSongs(songs:[Song]) ;
    func addSongs(songs:[Song])
}
