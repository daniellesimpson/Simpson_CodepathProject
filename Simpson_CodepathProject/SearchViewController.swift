//
//  SearchViewController.swift
//  Simpson_CodepathProject
//
//  Created by Simpson, Danielle on 9/27/16.
//  Copyright © 2016 Simpson, Danielle. All rights reserved.
//

import UIKit


internal struct movieSearchResult {
    
    //Movie information
     let image: UIImage
    
     let movieTitle: String
    
     let releaseDate: String
    
     let movieSynopsis: String
    
    //User information
    internal let username: String
    
    internal let checkTime: NSDate
    
    internal let profilePic: UIImage
}

class SearchViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet weak var searchCollectionView: UICollectionView!
    
    var myMovies: [NSDictionary]! = []
    var results: [[String : AnyObject]] = []
    var originalTitle = "original_title"
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //adding the logo to the NavBar
        let navImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 30))
        navImageView.contentMode = .ScaleAspectFit
        let navImage = UIImage(named: "wordMark.png")
        navImageView.image = navImage
        navigationItem.titleView = navImageView
        
        searchCollectionView.dataSource = self
        searchCollectionView.delegate = self
        searchCollectionView.backgroundColor = UIColorFromRGB(0xE2E3E4)
        SearchCollectionViewCell.appearance().backgroundColor = UIColorFromRGB(0xffffff)
        
        let url = NSURL(string: "https://api.themoviedb.org/3/movie/popular?api_key=ced1b9e67f9f9c305424201cdfaa3532&language=en-US")
        let request = NSURLRequest(URL: url!)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response:NSURLResponse?, data:NSData?, error:NSError?) in
            
            let myDictionary = try! NSJSONSerialization.JSONObjectWithData(data!, options: [])
            
            let dict = myDictionary as! [String : AnyObject]
            self.results = dict["results"] as! [[String : AnyObject]]
            
            self.searchCollectionView.reloadData()
            
            
        }
        

    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = searchCollectionView.dequeueReusableCellWithReuseIdentifier("searchCell", forIndexPath: indexPath) as! SearchCollectionViewCell
        
        //let movieNames = results[indexPath.row][originalTitle] as! String
        
        //print(movieNames)
        
        cell.movieTitle.text = results[indexPath.row][originalTitle] as! String
        //cell.moviePoster.image = myObjects[indexPath.row].image
        
        return cell
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
