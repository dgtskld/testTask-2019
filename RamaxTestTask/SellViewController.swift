//
//  SellViewController.swift
//  RamaxTestTask
//
//  Created by Vladimir Mazunin on 19/08/2019.
//  Copyright © 2019 Vladimir Mazunin. All rights reserved.
//

import UIKit

class SellViewController: UIViewController {

    @IBOutlet private var fieldName : UITextField?
    @IBOutlet private var fieldDescription : UITextField?
    @IBOutlet private var fieldPrice : UITextField?
    @IBOutlet private var buttonSell : UIButton?;
    
    @IBAction func addToBuyList (_ sender : UIButton) {
        
        let storedItem = Item(name: fieldName!.text!, description: fieldDescription!.text!, price: Double(fieldPrice!.text!) as! Double)
        
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("goods.plist")
        
        do {
            let data = try encoder.encode(storedItem)
            try data.write(to: path)
//            try data.write(to: path, options: <#T##Data.WritingOptions#>)
        } catch {
            print(error)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
