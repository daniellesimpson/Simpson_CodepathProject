//
//  movieStruct.swift
//  Simpson_CodepathProject
//
//  Created by Simpson, Danielle on 9/29/16.
//  Copyright © 2016 Simpson, Danielle. All rights reserved.
//

import Foundation

struct Movies {
    var movieTitle: String!
    var movieImage: NSData!
    var posterPath: String!
    var posterURL: NSURL!
    var posterData: NSData!
    var imagePath: String!
    var imageURL: NSURL!
    var imageData: NSData!
    var movieDescription: String!
    var resultsDate: String!
    var movieReleaseMonth: String!
    var movieReleaseYear: String!

    init (result: [String : AnyObject]) {
        self.movieTitle = result["original_title"] as! String
        self.resultsDate = result["release_date"] as! String
        self.movieDescription = result["overview"] as! String
        
        if resultsDate != "" {
            //pull the characters for the month and year
            let year = resultsDate.startIndex.advancedBy(4)
            let monthStart = resultsDate.startIndex.advancedBy(5)
            let monthEnd = resultsDate.endIndex.advancedBy(-3)
            let monthInt = resultsDate[Range(monthStart ..< monthEnd)]
            
            movieReleaseYear = resultsDate.substringToIndex(year)
            //user changeMonthName to conver the INT to a word.
            movieReleaseMonth = changeMonthName(monthInt)
            
        }
        else {
            movieReleaseYear = ""
            movieReleaseMonth = ""
        }

        
        if !(result["poster_path"] is NSNull){
            self.posterPath = result["poster_path"] as! String
            self.posterURL = NSURL(string: "https://image.tmdb.org/t/p/w500\(self.posterPath)")
            self.posterData = NSData(contentsOfURL: self.posterURL)
        }
        else {

            self.posterPath = ""
            self.posterData = nil
            
            
        }
        
        if !(result["backdrop_path"] is NSNull){
            self.imagePath = result["backdrop_path"] as! String
            self.imageURL = NSURL(string: "https://image.tmdb.org/t/p/w500\(self.imagePath)")
            self.imageData = NSData(contentsOfURL: self.imageURL)
        }
        else {
            
            self.imagePath = ""
            self.imageData = nil
            
            
        }
        
    }


    

    init(movieTitle: String, movieImage: NSData, movieDescription: String, posterPath: String, movieReleaseYear: String ) {

        self.movieTitle = movieTitle
        self.movieImage = nil
        self.posterPath = posterPath
        self.movieDescription = movieDescription
        self.movieReleaseYear = movieReleaseYear

}


}