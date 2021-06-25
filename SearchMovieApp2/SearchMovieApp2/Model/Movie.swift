//
//  Movie.swift
//  SearchMovieApp2
//
//  Created by Anton Veldanov on 6/25/21.
//

import UIKit







struct Movie: Codable{
    
    public private(set) var Title: String
    public private(set) var Year: String
    public private(set) var imdbID: String
    public private(set) var _Type: String
    public private(set) var Poster: String

    private enum CodingKeys: String, CodingKey{
        case Title, Year, imdbID, _Type = "Type", Poster
    }
}


struct MovieResult: Codable {
    public private(set) var Search: [Movie]
}
