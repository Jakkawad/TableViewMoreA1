//
//  ViewController.swift
//  TableViewMoreA1
//
//  Created by admin on 6/18/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView:UITableView!
    
    var tableDataSource = DataSource()
    

    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.section {
        case 1:
            let numberOfItems = tableDataSource.tableView(tableView, numberOfRowsInSection: 0)
            tableDataSource.getMoreItem()
            let newNumberOfItems = tableDataSource.tableView(tableView, numberOfRowsInSection: 0)
            let shouldHaveMoreButton = tableDataSource.numberOfSectionsInTableView(tableView) == 2
            var newIndexPaths = [NSIndexPath]()
            for n in numberOfItems ..< newNumberOfItems {
                newIndexPaths.append(NSIndexPath(forRow: n, inSection: 0))
            }
            
            tableView.beginUpdates()
            
            tableView.insertRowsAtIndexPaths(newIndexPaths, withRowAnimation: .Top)
            
            if !shouldHaveMoreButton {
                tableView.deleteSections(NSIndexSet(index: 1), withRowAnimation: .Top)
            }
            
            tableView.endUpdates()
            
            let scrollPointIndexPath:NSIndexPath
            
            
            if shouldHaveMoreButton {
                scrollPointIndexPath = indexPath
            } else {
                scrollPointIndexPath = NSIndexPath(forRow: numberOfItems - 1, inSection: 0)
            }
            
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                tableView.scrollToRowAtIndexPath(scrollPointIndexPath, atScrollPosition: .Top, animated: true)
                guard let selectedIndexPath = tableView.indexPathForSelectedRow  else { return }
                tableView.deselectRowAtIndexPath(selectedIndexPath, animated: true)
            }
            return
        default:
            return
        }
    }
    
    override func viewWillAppear(animated:Bool) {
        super.viewWillAppear(animated)
        tableView.dataSource = tableDataSource
        //tableView.estimatedRowHeight = 44.0
        //tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

