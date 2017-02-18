//
//  SongService.swift
//  MusicSearch
//
//  Created by MOSO33 on 2/18/17.
//  Copyright © 2017 JPMC. All rights reserved.
//

import Foundation

/**
 @description A fasade providing access to the Song service.
 Client code should only refer this interface in their code to
 get songs data.
 */

enum SongServiceError: Error {
    case noSongsAvailable
}

enum SongServiceResultType<T, SongServiceError> {
    case success(T)
    case error(Error)
}

typealias SongServiceFetchResult = SongServiceResultType<[Song], SongServiceError>

typealias SongServiceResponse = (_ result: SongServiceFetchResult) -> Void

class SongService{
    
    let apiClient : SongAPIClientProtocol
    let parser : SongParserProtocol
    
    init(apiClient: SongAPIClientProtocol, parser: SongParserProtocol) {
        self.apiClient = apiClient
        self.parser = parser 
    }
    
    /**
     Fetch songs based on search criteria
     - parameters:
     - artistName: Describe the artist name
     - songTitle: Describe the song title
     - onCompletionHandler: Async call back handler containing collection of matching songs
     */
    func fetchSongs(searchTerm: String, onCompletionHandler:@escaping SongServiceResponse){
        
        apiClient.fetchSongsRemotely(searchTerm: searchTerm) { apiResult in
            switch apiResult {
            case let .success(songs):
                return onCompletionHandler(.success((self.parser.songsFromJSON(JSON: songs))))
            case let .error(SongAPIError.invalidURL(urlString)):
                print(urlString)
                return onCompletionHandler(.error(SongServiceError.noSongsAvailable))
            case let .error(SongAPIError.networkError(error)):
                print(error.localizedDescription)
                return onCompletionHandler(.error(SongServiceError.noSongsAvailable))
            case .error(SongAPIError.deserialisingFailed):
                print("Wrong json data")
                return onCompletionHandler(.error(SongServiceError.noSongsAvailable))
            default:
                print("Other error")
                return onCompletionHandler(.error(SongServiceError.noSongsAvailable))
            }
        }
    }
}
