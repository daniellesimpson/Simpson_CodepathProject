//
//  MovieProfileViewController.swift
//  Simpson_CodepathProject
//
//  Created by Simpson, Danielle on 9/27/16.
//  Copyright © 2016 Simpson, Danielle. All rights reserved.
//

import UIKit

class MovieProfileViewController: UIViewController {


    @IBOutlet weak var myPoster: UIImageView!
    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var myDate: UILabel!
    @IBOutlet weak var myDescription: UILabel!
    @IBOutlet weak var myBackgroundImage: UIImageView!
    
    var viewMovie: Movies?
    var poster = UIImage()
    var background = UIImage()


    
    override func viewDidLoad() {
        super.viewDidLoad()

        //adding the logo to the NavBar
        let navImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 30))
        navImageView.contentMode = .Center
        let navImage = UIImage(named: "wordMark.png")
        navImageView.image = navImage
        navigationItem.titleView = navImageView
        navigationItem.title = ""

        
        
        // Loading variables here vs in prepare for segue is much more reliable
        myDate.text = (viewMovie?.movieRelease)!
        myTitle.text = (viewMovie?.movieTitle)!
        myDescription.text = (viewMovie?.movieDescription)!
        myPoster.image = poster
        myBackgroundImage.image = background
        
        //print(viewMovie?.movieTitle)
        print(viewMovie?.movieTitle)

    }


    
    
    @IBAction func didPressCheckIn(sender: UIButton) {
        performSegueWithIdentifier("checkInSegue", sender: true)

    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationViewController = segue.destinationViewController as! CheckInViewController
        destinationViewController.checkInMovie = viewMovie
        //destinationViewController.myTitle.text = myTitle.text
        

        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
