//
//  NewItemViewController.swift
//  Shopping
//
//  Created by Xinyi Zhang on 2018/3/19.
//  Copyright © 2018年 Zhangxinyi. All rights reserved.
//

import UIKit

protocol NewItemViewControllerDelegate
{
    func AddNewItem(controller: NewItemViewController , item: Item)
}

class NewItemViewController: UIViewController {
    
    var delegate : NewItemViewControllerDelegate? = nil
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var itemNameTextField: UITextField!
    @IBOutlet weak var brandNameTextField: UITextField!
    
    @IBAction func saveButton(_ sender: Any) {
        var item:Item
        if itemNameTextField.text != nil && brandNameTextField.text != nil {
            item = Item(itemName: itemNameTextField.text!,brandName: brandNameTextField.text!)
            delegate?.AddNewItem(controller: self, item: item)
            /*if delegate == nil
            {
                print("XXXXX")
            }*/
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func BackToMenu(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
