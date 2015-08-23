//
//  ViewController.swift
//  CellSelectionCallback
//
//  Created by Manuel Meyer on 23.08.15.
//  Copyright (c) 2015 Manuel Meyer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var array = [1,1]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for x in stride(from: 2, through: 30, by: 1){
            let i = array[x-2]
            let j = array[x-1]
            array.append(i+j)
        }
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! SelectionCallbackTableViewCell
        cell.selectionCallback = {
            println("\(self.array[indexPath.row]) at \(indexPath.row) on \(tableView) selected")
            
            self.array.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
        cell.textLabel?.text = "\(self.array[indexPath.row])"
        return cell
    }
    
}

