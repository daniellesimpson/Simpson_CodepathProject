//
//  ProfileViewController.swift
//  Simpson_CodepathProject
//
//  Created by Simpson, Danielle on 9/27/16.
//  Copyright © 2016 Simpson, Danielle. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var myScrollVIew: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //adding the logo to the NavBar
        let navImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 120, height: 30))
        navImageView.contentMode = .ScaleAspectFit
        let navImage = UIImage(named: "wordMark_lg2.png")
        navImageView.image = navImage
        navigationItem.titleView = navImageView
        navigationController?.navigationBar.barTintColor = UIColorFromRGB(0x000000)
        
        myScrollVIew.contentSize = CGSizeMake(320,850)

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
