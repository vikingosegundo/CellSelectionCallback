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
    
    var array: [UInt] = [1,1]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for x in stride(from: 2, through: Int.max, by: 1){
            let i = array[x - 2]
            let j = array[x - 1]
            if (UInt.max - j) > i{
                array.append(i+j)
            } else {
                break
            }
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
        
        let string = String(format: "%3d", arguments: [indexPath.row + 1])
        cell.textLabel?.text = "\(string): \(self.array[indexPath.row])"
        return cell
    }
    
}

