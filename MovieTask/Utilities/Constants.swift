//
//  Constants.swift
//  MovieTask
//
//  Created by Shahriar Mahmud on 2/25/21.
//

import UIKit

struct Constants {
    static let noInternet = "Internet is not available. Please check your network connectivity"
    
    static func getimageURL(artKey: String)-> String{
        return "http://d2snwnmzyr8jue.cloudfront.net/\(artKey)_270.jpeg"
    }
}
