//
//  Movie.swift
//  Unit2-Project
//
//  Created by A Rufin on 1/26/24.
//

import Foundation

struct MovieResponse: Decodable {
    let results: [Movie]
}

struct Movie: Decodable {
    let original_title: String
    let overview: String
    let poster_path: String
    let pImg_URL: String = "https://image.tmdb.org/t/p/original/"
    
    let vote_average: Double
    let vote_count: Int
    let popularity: Double
    
}
/*
//var placeholder = "https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png"
extension Movie {
    
    static var mockMovies: [Movie] = [
        Movie(Mov_title: "Wonka", Mov_desc: "Willy Wonka – chock-full of ideas and determined to change the world one delectable bite at a time – is proof that the best things in life begin with a dream, and if you’re lucky enough to meet Willy Wonka, anything is possible.", pImg_URL: URL(string: "https://image.tmdb.org/t/p/original/qhb1qOilapbapxWQn9jtRCMwXJF.jpg")!, vote_avg: 7.194, vote_count: 1404, film_pop: 3205.442),
        Movie(Mov_title: "Aquaman and the Lost Kingdom", Mov_desc: "Black Manta, still driven by the need to avenge his father's death and wielding the power of the mythic Black Trident, will stop at nothing to take Aquaman down once and for all. To defeat him, Aquaman must turn to his imprisoned brother Orm, the former King of Atlantis, to forge an unlikely alliance in order to save the world from irreversible destruction.", pImg_URL: URL(string: "https://image.tmdb.org/t/p/original/jXJxMcVoEuXzym3vFnjqDW4ifo6.jpg")!, vote_avg: 6.835, vote_count: 795, film_pop: 2998.367),
        Movie(Mov_title: "The Painter", Mov_desc: "An ex-CIA operative is thrown back into a dangerous world when a mysterious woman from his past resurfaces. Now exposed and targeted by a relentless killer and a rogue black ops program, he must rely on skills he thought he left behind in a high-stakes game of survival.", pImg_URL: URL(string: "https://image.tmdb.org/t/p/original/UZ0ydgbXtnrq8xZCI5lHVXVcH9.jpg")!, vote_avg:     5.9, vote_count: 18, film_pop: 608.011),
        Movie(Mov_title: "Oppenheimer", Mov_desc: "The story of J. Robert Oppenheimer's role in the development of the atomic bomb during World War II.", pImg_URL: URL(string: "https://image.tmdb.org/t/p/original/ptpr0kGAckfQkJeJIt8st5dglvd.jpg")!, vote_avg: 8.1, vote_count: 6332, film_pop: 562.532),
        Movie(Mov_title: "Lift", Mov_desc: "An international heist crew, led by Cyrus Whitaker, race to lift $500 million in gold from a passenger plane at 40,000 feet.", pImg_URL: URL(string: "https://image.tmdb.org/t/p/original/gma8o1jWa6m0K1iJ9TzHIiFyTtI.jpg")!, vote_avg: 6.415, vote_count: 495, film_pop: 1013.609)
    ]
}*/
