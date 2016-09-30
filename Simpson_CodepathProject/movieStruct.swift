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
    var imagePath: String!
    var imageURL: NSURL!
    var imageData: NSData!
    var movieDescription: String!

    init (result: [String : AnyObject]) {
        self.movieTitle = result["original_title"] as! String
        self.imagePath = result["poster_path"] as! String
        self.imageURL = NSURL(string: "https://image.tmdb.org/t/p/w500\(self.imagePath)")
        self.imageData = NSData(contentsOfURL: self.imageURL)
        
//        print(movieTitle)
//        print(imagePath)
//        print(imageURL)
        
    }


    

    init(movieTitle: String, movieImage: NSData, movieDescription: String, imagePath: String) {

        self.movieTitle = movieTitle
        self.movieImage = nil
        self.imagePath = imagePath
        self.movieDescription = movieDescription

}


}