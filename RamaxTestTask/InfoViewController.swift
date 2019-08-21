//
//  InfoViewController.swift
//  RamaxTestTask
//
//  Created by Vladimir Mazunin on 19/08/2019.
//  Copyright © 2019 Vladimir Mazunin. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet var labelName : UILabel!
    @IBOutlet var labelDescription : UILabel!
    @IBOutlet var labelPrice : UILabel!
    
    var nameToBeWritten = String()
    var descriptionToBeWritten = String()
    var priceToBeWritten = String()
    
    override func viewWillAppear(_ animated: Bool) {
        labelName.text = nameToBeWritten
        labelDescription.text = descriptionToBeWritten
        labelDescription.translatesAutoresizingMaskIntoConstraints = true
        labelDescription.sizeToFit()
        labelPrice.text = priceToBeWritten
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
