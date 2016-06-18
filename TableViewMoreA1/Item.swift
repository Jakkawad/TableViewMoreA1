//
//  Item.swift
//  TableViewMoreA1
//
//  Created by admin on 6/18/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import Foundation


struct Item:Equatable {
    let value:String
}

func == (lhs:Item, rhs:Item) -> Bool {
    return lhs.value == rhs.value
}