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
    
    @IBOutlet weak var mySearchTextfield: UITextField!
    var searchText: String!
    var myApi = "https://api.themoviedb.org/3/search/movie?api_key=ced1b9e67f9f9c305424201cdfaa3532&language=en-US&query="
    var searchMovieApi: String!
    
    var tempResults = [Movies]()
    var cellMovieTitle: String!
    var cellMoviePoster: UIImage!
    var cellMovieDate: String!
    var cellMovieDescription: String!

    

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
        return tempResults.count
        
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = searchCollectionView.dequeueReusableCellWithReuseIdentifier("searchCell", forIndexPath: indexPath) as! SearchCollectionViewCell
        let newResult = tempResults[indexPath.row]
        cell.movieTitleLabel.text = newResult.movieTitle
        
        if newResult.posterPath != ""{
        cell.searchMoviePoster.image = UIImage(data: newResult.posterData)
        }
        else {
            cell.searchMoviePoster.image = UIImage(named: "noPoster.jpg")
        }
        return cell
    }

    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
        let newResult = tempResults[indexPath.row]
        cellMovieTitle = newResult.movieTitle
        //adding the month and year to put in the same text box
        cellMovieDate = (newResult.movieReleaseMonth + " " + newResult.movieReleaseYear)
        cellMovieDescription = newResult.movieDescription
        
        
        if (newResult.posterData == nil) {
            cellMoviePoster = UIImage(named: "noPoster.jpg")
        }
        else {
            cellMoviePoster = UIImage(data: newResult.posterData)
        }
        

    }
    
    
    func makeCall() {
        print("CALL MADE")
        _ = ["content-type": "application/json"]
        let parameters = []
        
        var postData = NSData()
        
        do {
            postData = try NSJSONSerialization.dataWithJSONObject(parameters, options: .PrettyPrinted)
            
        }
        catch _ {
            print("FAIL")
        }
        
        
        let url = NSURL(string: searchMovieApi!)
        
        NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) in
            
            if error != nil {
                print(error)
                return
            }
            print("NOT AGAIN")
            
            let myDictionary = try! NSJSONSerialization.JSONObjectWithData(data!, options: [])
            let dict = myDictionary as! [String : AnyObject]
            let holder = dict["results"] as! [[String : AnyObject]]
            
            for index in holder {
                let movie = Movies(result: index)
                self.tempResults.append(movie)
                
                let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                dispatch_async(dispatch_get_global_queue(priority, 0)) {
                    dispatch_async(dispatch_get_main_queue()) {
                        
                        self.searchCollectionView.reloadData()
                    }
                }
            }
            
        }.resume()
    }
    


    
    @IBAction func searchNow(sender: AnyObject) {
        tempResults.removeAll()
        searchCollectionView.reloadData()
        view.endEditing(true)
        let textInput = mySearchTextfield.text! as String
        searchText = textInput.stringByReplacingOccurrencesOfString(" ", withString: "%20")
        searchMovieApi = (myApi + searchText)
        makeCall()
        

    }
    
    


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //if segue.identifier == "movieProfile" {
        let destinationViewController = segue.destinationViewController as! MovieProfileViewController
        destinationViewController.view.layoutIfNeeded()
        
        destinationViewController.myTitle.text = cellMovieTitle
        destinationViewController.myPoster.image = cellMoviePoster
        destinationViewController.myDate.text = cellMovieDate
        destinationViewController.myDescription.text = cellMovieDescription
        print(cellMoviePoster)
        
        //}
        
        
        //        if segue.identifier == "movieProfile" {}
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
    }
    

}
