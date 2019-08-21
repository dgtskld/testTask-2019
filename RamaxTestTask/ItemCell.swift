//
//  ItemCell.swift
//  RamaxTestTask
//
//  Created by Vladimir Mazunin on 19/08/2019.
//  Copyright © 2019 Vladimir Mazunin. All rights reserved.
//

import UIKit

final class ItemCell: UITableViewCell, ReusableIdentifier {
    
    @IBOutlet private var labelName : UILabel!
    @IBOutlet private var labelPrice : UILabel!
    @IBOutlet internal var customImageView : UIImageView!

}

extension ItemCell : ConfigurableCell {
    
    func configure(object: Item) {
        labelName.text = object.name;
        labelPrice.text = String(object.price!);
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
