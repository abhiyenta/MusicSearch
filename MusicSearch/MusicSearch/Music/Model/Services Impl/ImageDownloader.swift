//
//  ImageDownloader.swift
//  MusicSearch
//
//  Created by MOSO33 on 2/18/17.
//  Copyright © 2017 JPMC. All rights reserved.
//

import Foundation
import UIKit

//Its always better to go with SDWebImageView
extension UIImageView {
    public func getImageFromURL(urlString: String) {
        
        // make sure the string is URL encoded
        guard let urlwithPercentEscapes = urlString.addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed) else{
            return
        }
        
        // make sure the URL is valid
        guard let url = URL(string: urlwithPercentEscapes) else {
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            
            if let error = error  {
                print(error)
                return
            }
            
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
            
        }).resume()
    }}
