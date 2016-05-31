//
//  Settings.swift
//  ChristinaKeyboard
//
//  Created by Marcus on 30/05/2016.
//  Copyright © 2016 Marcus. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import SwiftyJSON
import SwiftyBeaver

class Settings: UITableViewController {
    
    let log = SwiftyBeaver.self //SwiftyBeaver
    let textCellIdentifier = "cell" //ReusableIdentifier
    var items = [[""] , [""]]
    var imagelist = [[UIImage()],[UIImage()]]
    let sections = ["Information","3rd Party Software"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let SectionA = ["About", "Send Feedback"]
        let SectionAi = [UIImage(named: "715-globe-toolbar@3x.png")!, UIImage(named: "870-smile@3x.png")!]
        let SectionB = ["Software"]
        let SectionBi = [UIImage(named: "341-keyboard@3x.png")!]
        
        items = [SectionA, SectionB]
        imagelist = [SectionAi, SectionBi]
        
        tableView.reloadData()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return items.count
    }
    
    // MARK:  UITextFieldDelegate Methods
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as UITableViewCell
        let cellText = items[indexPath.section][indexPath.row]
        let row = indexPath.row
        cell.textLabel?.text = cellText
        
        let tintableImage = imagelist[indexPath.section][row].imageWithRenderingMode(.AlwaysTemplate)
        cell.imageView?.tintColor = UIColor(red:1.000, green:0.384, blue:0.316, alpha:1.000)
        cell.imageView?.image = tintableImage
        
        return cell
    }
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < sections.count {
            return sections[section]
        }
        
        return nil
    }
    
    // MARK:  UITableViewDelegate Methods
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        switch items[indexPath.section][indexPath.row] {
        case "About":
            let View = self.storyboard?.instantiateViewControllerWithIdentifier("About")
            self.navigationController?.pushViewController(View!, animated: true)
        case "Send Feedback":
            let View = self.storyboard?.instantiateViewControllerWithIdentifier("Feedback")
            self.navigationController?.pushViewController(View!, animated: true)
        case "Software":
            let View = self.storyboard?.instantiateViewControllerWithIdentifier("Software")
            self.navigationController?.pushViewController(View!, animated: true)
        default:
            print()
        }
        
    }
    
}
