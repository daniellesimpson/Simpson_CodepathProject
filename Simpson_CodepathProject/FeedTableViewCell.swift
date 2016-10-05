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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
