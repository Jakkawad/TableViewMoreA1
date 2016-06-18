//
//  Cell0TableViewCell.swift
//  TableViewMoreA1
//
//  Created by admin on 6/18/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit

class Cell0TableViewCell: UITableViewCell {

    @IBOutlet weak var lblName:UILabel!
    
    func configureWithItem(item:Item) -> () {
        lblName.text = item.value
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
