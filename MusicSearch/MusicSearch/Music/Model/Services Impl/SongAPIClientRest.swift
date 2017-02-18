//
//  SongAPIClientRest.swift
//  MusicSearch
//
//  Created by MOSO33 on 2/18/17.
//  Copyright © 2017 JPMC. All rights reserved.
//

import Foundation

class SongAPIClientRest: SongAPIClientProtocol {

    //going with try/catch approach than Result enum approach
    func fetchSongsRemotely(searchTerm: String, onCompletionHandler: @escaping SongAPIResponse)  {
        
        //get api end point and construct end point
        let songAPIEndPointString = Constants.SongApi.BaseUrl + "?term=\(searchTerm)"
        
        // make sure the string is URL encoded
        guard let urlwithPercentEscapes = songAPIEndPointString.addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed) else{
            return onCompletionHandler(.error(SongAPIError.invalidURL(urlString: songAPIEndPointString)))
        }
        
        // make sure the URL is valid
        guard let url = URL(string: urlwithPercentEscapes) else {
            return onCompletionHandler(.error(SongAPIError.invalidURL(urlString: songAPIEndPointString)))
        }
        
        //construct request
        let urlRequest = URLRequest(url: url)
        
        // set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        session.dataTask(with: urlRequest) { (data, response, error) in
            do {
                //make sure data is received
                guard let data = data else {
                    return onCompletionHandler(.error(SongAPIError.noData))
                }
                
                //make sure json de-serrialization completed
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary else {
                    return onCompletionHandler(.error(SongAPIError.deserialisingFailed))
                }
                
                //make sure songs are present
                guard let songs = json["results"] as? Array<Any> else {
                    return onCompletionHandler(.error(SongAPIError.noData))
                }
                
                return onCompletionHandler(.success(songs))
                
            } catch let error as NSError {
                print(error.debugDescription)
            }
        }.resume()

    }
        
}
