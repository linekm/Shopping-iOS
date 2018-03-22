//
//  ViewController.swift
//  Shopping
//
//  Created by Xinyi Zhang on 2018/3/17.
//  Copyright © 2018年 Zhangxinyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,NewItemViewControllerDelegate,ItemStatusRemoveItemDelegate
{
    func RemoveItem(controller: ItemStatusViewController, item: Item) {
        var index = 0 , count = 0
        for i in toBuyItem
        {
            if i.brandName == item.brandName && i.itemName == item.itemName && i.isBuy == item.isBuy
            {
                index = count
                break
            }
            count += 1
        }
        toBuyItem.remove(at: index)
        tableView.reloadData()
        controller.dismiss(animated: true, completion: nil)

    }
    
    func AddNewItem(controller: NewItemViewController, item: Item) {
        toBuyItem.append(item)
        tableView.reloadData()
        controller.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var toBuyItem = [Item(itemName: "巧克力",brandName: "德芙"),
                     Item(itemName: "方便面",brandName: "康师傅"),
                     Item(itemName: "矿泉水",brandName: "怡宝"),
                     Item(itemName: "洗发水",brandName: "飘柔")]
    var itemIndex:Int = 0

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int//负责每个section的row值
    {
        return toBuyItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell//返回tableView所需要显示的每个单元格的对象
    {
        let identify = "Cell"
        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: identify)
        let item = toBuyItem[indexPath.row]
        cell.textLabel?.text = item.itemName
        if item.isBuy
        {
            cell.textLabel?.textColor = UIColor.green
        }
        else
        {
            cell.textLabel?.textColor = UIColor.red
        }
        cell.detailTextLabel?.text = item.brandName
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)//处理页面详情
    {
        self.tableView!.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "itemSegue", sender: self.toBuyItem[indexPath.row])
        itemIndex = indexPath.row
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)//给新页面传递参数
    {
        if segue.identifier == "newItemSegue"//添加新项
        {
            let controller = segue.destination as! UINavigationController
            let detailController = controller.viewControllers.first as! NewItemViewController
            detailController.delegate = self
        }
        else if segue.identifier == "itemSegue"
        {
            let controller = segue.destination as! UINavigationController
            let detailController = controller.viewControllers.first as! ItemStatusViewController
            detailController.item = sender as? Item
            detailController.itemIndex_ = itemIndex
            detailController.delegate = self
            print(itemIndex)
        }
    }
    
}

