//
//  MovideDetailsResponse.swift
//  MovieTask
//
//  Created by Shahriar Mahmud on 2/28/21.
//

import Foundation

struct MovideDetailsResponse: Decodable, CustomStringConvertible {
    var description: String{
        return ""
    }
    
    @NestedKey
    var publisherName: String?
    var title: String?
    var synopsis: String?
    @NestedKey
    var language: String?
    var releaseDate: Int?
    var artists: [Artist]?
    var rating: String?
    var genres: [Genres]?
    
    enum CodingKeys: String, NestableCodingKey {
        case publisherName = "publisher/name"
        case title
        case synopsis
        case language = "language/name"
        case releaseDate
        case artists
        case rating
        case genres
    }
}

struct Artist: Decodable, CustomStringConvertible {
    var description: String{
        return ""
    }
    var name: String?
    var relationship: String?
    

    enum CodingKeys: String, NestableCodingKey {
        case name
        case relationship
    }
}

struct Genres: Decodable, CustomStringConvertible {
    var description: String{
        return ""
    }
    var name: String?
    

    enum CodingKeys: String, NestableCodingKey {
        case name
    }
}
