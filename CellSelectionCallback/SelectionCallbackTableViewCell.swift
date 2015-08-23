//
//  SelectionCallbackTableViewCell.swift
//  CellSelectionCallback
//
//  Created by Manuel Meyer on 23.08.15.
//  Copyright (c) 2015 Manuel Meyer. All rights reserved.
//

import UIKit

class SelectionCallbackTableViewCell: UITableViewCell {
    var selectionCallback: (() -> Void)?
    @IBOutlet weak var button: UIButton!
    @IBAction func buttonTapped(sender: UIButton) {
        if let selectionCallback = self.selectionCallback{
            selectionCallback()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.addSubview(self.button)

    }
}
