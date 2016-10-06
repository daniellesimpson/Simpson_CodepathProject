//
//  CheckInViewController.swift
//  Simpson_CodepathProject
//
//  Created by Simpson, Danielle on 10/3/16.
//  Copyright © 2016 Simpson, Danielle. All rights reserved.
//

import UIKit

class CheckInViewController: UIViewController {
    
    var checkInMovie: Movies?
    
    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var myDate: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var confirmBTN: UIButton!
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var movieConfirmed: Bool!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTitle.text = (checkInMovie?.movieTitle)!
        myDate.text = (checkInMovie?.movieRelease)!
        myImage.image = UIImage(data: (checkInMovie?.imageData)!)
        backgroundImage.image = UIImage(data: (checkInMovie?.imageData)!)
        
        
        let navImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 120, height: 30))
        navImageView.contentMode = .ScaleAspectFit
        let navImage = UIImage(named: "wordMark.png")
        navImageView.image = navImage
        navigationItem.titleView = navImageView
        navigationController?.navigationBar.barTintColor = UIColorFromRGB(0x000000)
        navigationController?.navigationBar.tintColor = UIColorFromRGB(0xffffff)
        //movieConfirmed = false

        
    }
    
    @IBAction func didConfirmChecking(sender: UIButton) {
        
        let myVar = self.navigationController?.viewControllers[1] as! MovieProfileViewController
        myVar.didConfirm = true
        myVar.checkInBtn.selected = true
        print(myVar.didConfirm)
        self.navigationController?.popViewControllerAnimated(true)
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
