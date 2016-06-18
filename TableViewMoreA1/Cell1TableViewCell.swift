//
//  Cell1TableViewCell.swift
//  TableViewMoreA1
//
//  Created by admin on 6/18/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit

class Cell1TableViewCell: UITableViewCell {

    @IBOutlet weak var lblLoadMore:UILabel!
    
    lazy var textColour = {
        UIColor(red: 0.196, green: 0.3098, blue: 0.52, alpha: 1.0)
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lblLoadMore.textColor = textColour
        lblLoadMore.text = NSLocalizedString("Load More Button",value: "Load More", comment: "String for Load More button")
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
