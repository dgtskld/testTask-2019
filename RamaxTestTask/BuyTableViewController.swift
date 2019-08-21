//
//  BuyTableViewController.swift
//  RamaxTestTask
//
//  Created by Vladimir Mazunin on 18/08/2019.
//  Copyright © 2019 Vladimir Mazunin. All rights reserved.
//

import UIKit

protocol LocationProviderDelegate: class {
    func didSelectLocation(_ location: Item)
}

class BuyTableViewController: UITableViewController {
    
    weak var delegate:LocationProviderDelegate?
    
    private var goodsDataSource: GoodsDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
    
    func loadData() {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = NSURL(fileURLWithPath: path)
        if let pathComponent = url.appendingPathComponent("goods.plist") {
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: pathComponent.path) {
                goodsDataSource = GoodsDataSource(tableView: tableView, from: pathComponent.path)
                tableView.dataSource = goodsDataSource
            } else {
                if let plistPath = Bundle.main.path(forResource: "goods", ofType: "plist") {
                    goodsDataSource = GoodsDataSource(tableView: tableView, from: plistPath)
                    tableView.dataSource = goodsDataSource
                }
            }
        } else {
            if let plistPath = Bundle.main.path(forResource: "goods", ofType: "plist") {
                goodsDataSource = GoodsDataSource(tableView: tableView, from: plistPath)
                tableView.dataSource = goodsDataSource
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "viewInfoSegue",
            let destinationViewController = segue.destination as? InfoViewController,
            let dataIndex = tableView.indexPathForSelectedRow?.row
        {
            destinationViewController.nameToBeWritten = goods[dataIndex].name
            destinationViewController.descriptionToBeWritten = goods[dataIndex].description!
            destinationViewController.priceToBeWritten = goods[dataIndex].price!
        }
    }
    
}

