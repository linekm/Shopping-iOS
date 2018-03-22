//
//  ItemStatusViewController.swift
//  Shopping
//
//  Created by Xinyi Zhang on 2018/3/19.
//  Copyright © 2018年 Zhangxinyi. All rights reserved.
//

import UIKit
protocol ItemStatusRemoveItemDelegate
{
    func RemoveItem(controller : ItemStatusViewController , item: Item) 
}

class ItemStatusViewController: ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBOutlet weak var itemNameLable: UILabel!
    @IBOutlet weak var brandNameLable: UILabel!
    
    var item:Item?
    var itemIndex_:Int = 0
    var delegate : ItemStatusRemoveItemDelegate? = nil
    
    fileprivate func ItemColor() {
        if item?.isBuy == false
        {
            itemNameLable.textColor = UIColor.green
            brandNameLable.textColor = UIColor.green
        }
        else
        {
            itemNameLable.textColor = UIColor.red
            brandNameLable.textColor = UIColor.red
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if item != nil
        {
            itemNameLable.text = item?.itemName
            brandNameLable.text = item?.brandName
        }
    }
    @IBAction func isBuy(_ sender: Any) {
        if item?.isBuy == false
        {
            item?.isBuy = true
            itemNameLable.textColor = UIColor.green
            brandNameLable.textColor = UIColor.green
        }
        else
        {
            item?.isBuy = false
            itemNameLable.textColor = UIColor.red
            brandNameLable.textColor = UIColor.red
            
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func DelateItem(_ sender: Any) {
            delegate?.RemoveItem(controller : self , item: item!)
        
    }
    
    @IBAction func BackToMenu(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
