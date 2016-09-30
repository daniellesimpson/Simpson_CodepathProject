//
//  MainViewController.swift
//  Simpson_CodepathProject
//
//  Created by Simpson, Danielle on 9/26/16.
//  Copyright © 2016 Simpson, Danielle. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var myContainerView: UIView!
    
    @IBOutlet weak var myFeedBtn: UIButton!
    @IBOutlet weak var myPopcornBtn: UIButton!
    @IBOutlet weak var myProfileBtn: UIButton!
    
    var feedVC: UIViewController!
    var feedNav: UINavigationController!
    
    var popcornVC: UIViewController!
    var popcornNav: UINavigationController!
    
    var myProfileVC: UIViewController!
    var myProfileNav: UINavigationController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        var myStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        feedVC = storyboard!.instantiateViewControllerWithIdentifier("feedVC")
        feedNav = UINavigationController(rootViewController: feedVC)
        
        popcornVC = storyboard!.instantiateViewControllerWithIdentifier("popcornVC")
        popcornNav = UINavigationController(rootViewController: popcornVC)
        
        myProfileVC = storyboard!.instantiateViewControllerWithIdentifier("myProfileVC")
        myProfileNav = UINavigationController(rootViewController: myProfileVC)
        
         myContainerView.addSubview(popcornNav.view)
        

        // Do any additional setup after loading the view.
    }

    @IBAction func didPressFeed(sender: AnyObject) {
        myContainerView.addSubview(feedNav.view)
        
    }
    
    @IBAction func didPressPopcorn(sender: AnyObject) {
        myContainerView.addSubview(popcornNav.view)
    }
    
    @IBAction func didPressProfile(sender: AnyObject) {
        myContainerView.addSubview(myProfileNav.view)
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
