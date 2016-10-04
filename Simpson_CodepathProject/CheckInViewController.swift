//
//  CheckInViewController.swift
//  Simpson_CodepathProject
//
//  Created by Simpson, Danielle on 10/3/16.
//  Copyright © 2016 Simpson, Danielle. All rights reserved.
//

import UIKit

class CheckInViewController: UIViewController {
    
    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var myDate: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var confirmBTN: UIButton!
    
    
    var checkInMovie: Movies?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //myTitle.text = movieSelected?.movieTitle
        
        
        
        //adding the logo to the NavBar
        let navImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 30))
        navImageView.contentMode = .ScaleAspectFit
        let navImage = UIImage(named: "wordMark.png")
        navImageView.image = navImage
        navigationItem.titleView = navImageView
        navigationItem.title = ""
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    
}
