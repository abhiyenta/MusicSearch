//
//  SongAPIClientProtocol.swift
//  MusicSearch
//
//  Created by MOSO33 on 2/17/17.
//  Copyright © 2017 JPMC. All rights reserved.
//

import Foundation

/**
 @description Encapsulates Song API access. Implementing class could be REST/SOAP/File..
 Only referred by Song service. No direct access to clients.
 */

enum SongAPIError: Error {
    case noData
    case invalidURL(urlString: String)
    case deserialisingFailed
    case networkError(error: Error)
}

enum ResultType<T, SongAPIError> {
    case success(T)
    case error(Error)
}

typealias FetchResult = ResultType<Array<Any>, SongAPIError>

typealias APIResponse = (_ result: FetchResult) -> Void

protocol SongAPIClientProtocol {
    /**
     Fetch song data from remote service
     - parameters:
     - artistName: Describe the artist name
     - songTitle: Describe the song title
     - onCompletionHandler: Async call back handler describing JSON dictionary
     */
    func fetchSongsRemotely(artistName: String, songTitle: String, onCompletionHandler: @escaping APIResponse) 
}
