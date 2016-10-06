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
    
    var didConfirm = false

    @IBOutlet weak var checkInBtn: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        //adding the logo to the NavBar
        let navImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 120, height: 30))
        navImageView.contentMode = .ScaleAspectFit
        let navImage = UIImage(named: "wordMark.png")
        navImageView.image = navImage
        navigationItem.titleView = navImageView
        navigationController?.navigationBar.barTintColor = UIColorFromRGB(0xe53725)
        navigationController?.navigationBar.tintColor = UIColorFromRGB(0xffffff)


        
        
        // Loading variables here vs in prepare for segue is much more reliable
        myDate.text = (viewMovie?.movieRelease)!
        myTitle.text = (viewMovie?.movieTitle)!
        myDescription.text = (viewMovie?.movieDescription)!
        myPoster.image = poster
        myBackgroundImage.image = background
        
        //print(viewMovie?.movieTitle)
        print(viewMovie?.movieTitle)

    }
    
    override func viewDidAppear(animated: Bool) {
        
        if checkInBtn.selected == true{
            checkInBtn.backgroundColor = UIColorFromRGB(0x90989D)
            checkInBtn.setTitle("Watched", forState: .Normal)
            checkInBtn.tintColor = UIColorFromRGB(0x90989D)
            checkInBtn.frame = checkInBtn.frame
        }
        else{
            checkInBtn.backgroundColor = UIColorFromRGB(0x000000)
        }
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
