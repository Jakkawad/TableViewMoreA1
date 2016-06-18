//
//  DataSource.swift
//  TableViewMoreA1
//
//  Created by admin on 6/18/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit

class DataSource: NSObject, UITableViewDataSource {

    let maximumNumberOfItem = 40
    let numberOfItemToAdd = 10
    var numberOfItem = 10
    
    lazy var items:[Item] = {
        var list = [Item]()
        for _ in 0 ..< self.maximumNumberOfItem {
            list.append(Item(value:NSUUID().UUIDString))
        }
        return list
    }()
    
    func getMoreItem() {
        numberOfItem = min(numberOfItem + numberOfItemToAdd, maximumNumberOfItem)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //return 1
        switch (numberOfItem < maximumNumberOfItem) {
        case true:
            return 2
        case false:
            return 1
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 2
        switch section {
        case 0:
            return numberOfItem
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        /*
         let cell0 = tableView.dequeueReusableCellWithIdentifier("tableCell0")
         return cell0!
         */
        switch indexPath.section {
        case 0:
            let cell0 = tableView.dequeueReusableCellWithIdentifier("tableCell0") as? Cell0TableViewCell
            //cell0?.textLabel?.text = items[indexPath.row]
            cell0?.configureWithItem(items[indexPath.row])
            return cell0!
        default:
            let cell1 = tableView.dequeueReusableCellWithIdentifier("tableCell1") as? Cell1TableViewCell
            return cell1!
        }
    }
}
