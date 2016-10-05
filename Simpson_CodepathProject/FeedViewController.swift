//
//  FeedViewController.swift
//  Simpson_CodepathProject
//
//  Created by Simpson, Danielle on 9/27/16.
//  Copyright © 2016 Simpson, Danielle. All rights reserved.
//

import UIKit

@IBDesignable class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var feedTableView: UITableView!

    var myGradient = CAGradientLayer()
    let gradientTop = UIColorFromRGB(0x000000).colorWithAlphaComponent(1)
    let gradientBottom = UIColor.blackColor().CGColor
    var myMovies = ["Mean Girls","Annie","Avengers"]
    var myUsers = ["Danielle","Adey","Ravi"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedTableView.dataSource = self
        feedTableView.delegate = self

        //adding the logo to the NavBar
        let navImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 120, height: 30))
        navImageView.contentMode = .ScaleAspectFit
        let navImage = UIImage(named: "wordMark.png")
        navImageView.image = navImage
        navigationItem.titleView = navImageView

        //myFeedView.backgroundColor = UIColorFromRGB(0xE2E3E4)
        
        myMovies = ["Mean Girls","Annie","Avengers"]
        myUsers = ["Danielle","Adey","Ravi"]
        
    }


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myUsers.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = feedTableView.dequeueReusableCellWithIdentifier("feedCell") as! FeedTableViewCell
        cell.movieTitle.text = myMovies[index]
        cell.friendName.text = myUsers[index]
//        cell.myGradient.colors = [gradientTop, gradientBottom]
//        myGradient.frame = cell.myGradientHolder.frame
//        myGradient.locations = [0.0, 0.8]
//        cell.myGradientHolder.layer.insertSublayer(myGradient, atIndex: 3)
//        
//        print("🔮🔮🔮🔮🔮🔮🔮🔮🔮🔮")
        
        return cell
        
    }
    
    
    func setUpGradient() {
        
        let gradientTop = UIColorFromRGB(0x000000).colorWithAlphaComponent(1)
        let gradientBottom = UIColor.blackColor().CGColor
        
        myGradient.colors = [gradientTop, gradientBottom]
        //myGradient.frame = myGradientHolder.frame
        myGradient.locations = [0.0, 0.8]
        //cell.myGradientHolder.layer.insertSublayer(myGradient, atIndex: 3)
        
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
