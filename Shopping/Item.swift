//
//  Item.swift
//  Shopping
//
//  Created by Xinyi Zhang on 2018/3/19.
//  Copyright © 2018年 Zhangxinyi. All rights reserved.
//

import Foundation

class Item {
    
    var itemName = ""
    var brandName = ""
    var isBuy = false
    
    //指定构造器
    init(itemName: String , brandName: String , isBuy: Bool) {
        self.itemName = itemName
        self.brandName = brandName
        self.isBuy = isBuy
    }
    
    //便利结构器
    convenience init(itemName: String)
    {
        self.init(itemName: itemName, brandName: "", isBuy: false)
    }
    
    convenience init(itemName: String , brandName: String)
    {
        self.init(itemName: itemName, brandName: brandName, isBuy: false)
    }
}
