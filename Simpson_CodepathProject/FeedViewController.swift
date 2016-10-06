//
//  FeedViewController.swift
//  Simpson_CodepathProject
//
//  Created by Simpson, Danielle on 9/27/16.
//  Copyright © 2016 Simpson, Danielle. All rights reserved.
//

import UIKit

struct myInstragramImage {
    let image: UIImage
    let username: String
    let profilePic: UIImage
    let movieTitle: String
    let time: String
}

var myObjects = [(image: UIImage(named: "Mermaid.png")!, username: "adeylady123", movieTitle:"The Little Mermaid", profilePic: UIImage(named: "Madison.png")!, time: "2 hours ago"),
                 (image: UIImage(named: "Avengers.png")!, username: "danielleSimpson", movieTitle:"Avengers", profilePic: UIImage(named: "Katherine.png")!, time: "3 hours ago"),
                 (image: UIImage(named: "Interstellar-1.png")!, username: "RaviG_007", movieTitle:"Interstellar", profilePic: UIImage(named: "Danielle.png")!, time: "yesterday"),
                 (image: UIImage(named: "rudolph.jpg")!, username: "Isabella22", movieTitle:"Rudolph The Red Nose Reindeer", profilePic: UIImage(named: "Dustin.png")!, time: "yesterday"),
                 (image: UIImage(named: "AmericanReunion.jpg")!, username: "BobbySmith85", movieTitle:"American Reunion", profilePic: UIImage(named: "Adey.png")!, time: "Last Week"),
                 (image: UIImage(named: "StarWars.jpg")!, username: "Elwood", movieTitle:"Star Wars", profilePic: UIImage(named: "Mermaid.png")!, time: "Last Month")]

@IBDesignable class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var feedTableView: UITableView!
    @IBOutlet weak var myGradientHolder: UIView!
    var myMovies: [String]!
    var myUsers: [String]!
    var myBackgrounds: [UIImage]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedTableView.dataSource = self
        feedTableView.delegate = self

        //adding the logo to the NavBar
        let navImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 120, height: 30))
        navImageView.contentMode = .ScaleAspectFit
        let navImage = UIImage(named: "wordMark_lg2.png")
        navImageView.image = navImage
        navigationItem.titleView = navImageView
        navigationController?.navigationBar.barTintColor = UIColorFromRGB(0x000000)

        
    }

   

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myObjects.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = feedTableView.dequeueReusableCellWithIdentifier("feedCell") as! FeedTableViewCell
        
        cell.profilePhoto.layer.cornerRadius = cell.profilePhoto.frame.height / 2
        
        cell.movieTitle.text = myObjects[index].movieTitle
        cell.friendName.text = myObjects[index].username + " watched"
        cell.movieBackground.image = myObjects[index].image
        cell.timeWatched.text = myObjects[index].time
        cell.profilePhoto.image = myObjects[index].profilePic
        
        
        print("🔮🔮🔮🔮🔮🔮🔮🔮🔮🔮")
        cell.setUpGradient()
        cell.bringSubviewToFront(cell.movieTitle)
        
        
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
