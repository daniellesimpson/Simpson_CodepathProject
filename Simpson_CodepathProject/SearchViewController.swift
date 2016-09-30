//
//  SearchViewController.swift
//  Simpson_CodepathProject
//
//  Created by Simpson, Danielle on 9/27/16.
//  Copyright © 2016 Simpson, Danielle. All rights reserved.
//

import UIKit
import Foundation


class SearchViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var searchCollectionView: UICollectionView!
    
    //var myMovies: [NSDictionary]! = []
    //var tempResults: [[String : AnyObject]] = []
    
    //var originalTitle = "title"
    //var posterPath = "poster_path"
    //var moviePosterPath: String!
    //var imageUrl: NSURL!
    //var imageData: NSData!
    
    @IBOutlet weak var mySearchTextfield: UITextField!
    var searchText: String!
    var myApi = "https://api.themoviedb.org/3/search/movie?api_key=ced1b9e67f9f9c305424201cdfaa3532&language=en-US&query="
    var searchMovieApi: String!
    
    var tempResults = [Movies]()

    

    override func viewDidLoad() {
        super.viewDidLoad()

        //adding the logo to the NavBar
        let navImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 30))
        navImageView.contentMode = .ScaleAspectFit
        let navImage = UIImage(named: "wordMark.png")
        navImageView.image = navImage
        navigationItem.titleView = navImageView
        
        //setting up my collection view, and give the collectionView/cell background colors
        searchCollectionView.dataSource = self
        searchCollectionView.delegate = self
        searchCollectionView.backgroundColor = UIColorFromRGB(0xE2E3E4)
        SearchCollectionViewCell.appearance().backgroundColor = UIColorFromRGB(0xffffff)

        
    }
    
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Number of items")
        return tempResults.count
        
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        print("cell for item")
        let cell = searchCollectionView.dequeueReusableCellWithReuseIdentifier("searchCell", forIndexPath: indexPath) as! SearchCollectionViewCell
        print("use identifier")
        let newResult = tempResults[indexPath.row]
        print(newResult.movieTitle)
        print(newResult.imageURL)
        cell.movieTitleLabel.text = newResult.movieTitle
        cell.searchMoviePoster.image = UIImage(data: newResult.imageData)
        
       
        
        return cell
    }
    

    func makeCall() {
        print("Call Made")
        _ = ["content-type": "application/json"]
        let parameters = []
        
        var postData = NSData()
        
        do {
            postData = try NSJSONSerialization.dataWithJSONObject(parameters, options: .PrettyPrinted)
            
        }
        catch _ {
            print("FAIL")
        }
        
        print("Caught")
        
        let url = NSURL(string: searchMovieApi!)
        
        NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) in
            print("NSURL Session")
            
            if error != nil {
                print(error)
                return
            }
            print("myDictionary")
            let myDictionary = try! NSJSONSerialization.JSONObjectWithData(data!, options: [])
            let dict = myDictionary as! [String : AnyObject]
            let holder = dict["results"] as! [[String : AnyObject]]
            print("For loop")
            for index in holder {
                let movie = Movies(result: index)
                self.tempResults.append(movie)
                self.searchCollectionView.reloadData()
                print("reload data")
            }
            print("for loop done")
            //self.searchCollectionView.reloadData()
            
            
        }.resume()
        
        print("resume")
    }
    


    
    @IBAction func searchNow(sender: AnyObject) {
        
        let textInput = mySearchTextfield.text! as String
        searchText = textInput.stringByReplacingOccurrencesOfString(" ", withString: "%20")
        searchMovieApi = (myApi + searchText)
        print("Make Call")
        makeCall()
        

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
