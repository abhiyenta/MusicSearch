//
//  SongParserProtocol.swift
//  MusicSearch
//
//  Created by MOSO33 on 2/17/17.
//  Copyright © 2017 JPMC. All rights reserved.
//

import Foundation

/**
 @description A fasade used to map the JSON song data to in-memory objects.
 Only referred by Song service. No direct access to clients.
 */

protocol SongParserProtocol {
    /**
     @description Given an array of JSON dictionaries, returns a list
     of song objects.
     @param JSON The deserialized JSON object in NSArray format.
     @return An array of song objects.
     */
    func songsFromJSON(JSON: Array<Any>) -> [Song]
}
