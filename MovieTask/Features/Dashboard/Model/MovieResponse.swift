//
//  MovieResponse.swift
//  MovieTask
//
//  Created by Shahriar Mahmud on 2/28/21.
//

import Foundation

struct MovieResponse: Decodable, CustomStringConvertible {
    var description: String{
        return ""
    }
    
    var titleId: Int?
    var title: String?
    var kindId: Int?
    var kind: String?
    var artistName: String?
    var demo: Bool?
    var pa: Bool?
    var edited: Bool?
    var artKey: String?
    var children: Bool?
    var popularityRank: Int?
    var fixedLayout: Bool?
    var readAlong: Bool?

    enum CodingKeys: String, NestableCodingKey {
        case titleId
        case title
        case kindId
        case kind
        case artistName
        case demo
        case pa
        case edited
        case artKey
        case children
        case popularityRank
        case fixedLayout
        case readAlong
    }
}
