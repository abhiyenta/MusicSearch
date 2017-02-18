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

enum APIError: Error {
    case noData
    case invalidURL(urlString: String)
    case deserialisingFailed
    case networkError(error: Error)
}

enum SongAPIResultType<T, APIError> {
    case success(T)
    case error(Error)
}

typealias SongAPIFetchResult = SongAPIResultType<Array<Any>, APIError>

typealias SongAPIResponse = (_ result: SongAPIFetchResult) -> Void

protocol SongAPIClientProtocol {
    /**
     Fetch song data from remote service
     - parameters:
     - artistName: Describe the artist name
     - songTitle: Describe the song title
     - onCompletionHandler: Async call back handler describing JSON dictionary
     */
    func fetchSongsRemotely(searchTerm: String, onCompletionHandler: @escaping SongAPIResponse)
}
