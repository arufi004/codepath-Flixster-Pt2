//
//  Poster.swift
//  Unit2-Project
//
//  Created by A Rufin on 2/11/24.
//

import Foundation

struct PosterResponse: Decodable {
    let results: [Poster]
}

struct Poster: Decodable {
    let poster_path: String
    static var PosterUrl: String = "https://image.tmdb.org/t/p/original/"
}
