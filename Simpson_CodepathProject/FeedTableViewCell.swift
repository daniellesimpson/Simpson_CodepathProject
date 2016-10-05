//
//  FeedTableViewCell.swift
//  Simpson_CodepathProject
//
//  Created by Simpson, Danielle on 10/5/16.
//  Copyright © 2016 Simpson, Danielle. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var movieBackground: UIImageView!
    
    @IBOutlet weak var myGradientHolder: UIView!
    
    @IBOutlet weak var profilePhoto: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var friendName: UILabel!
    
    @IBOutlet weak var timeWatched: UILabel!
    var myGradient = CAGradientLayer()
    let gradientTop = UIColorFromRGB(0x000000).colorWithAlphaComponent(1)
    let gradientBottom = UIColor.blackColor().CGColor
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    
        func setUpGradient() {
    
            myGradient.colors = [gradientTop, gradientBottom]
            myGradient.frame = movieBackground.frame
            myGradient.locations = [0.0, 0.8]
            myGradientHolder.layer.insertSublayer(myGradient, atIndex: 0)
            
            print("running")
            
        }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
