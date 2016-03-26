//
//  RootViewController.swift
//  NSCodingProtocolPractice
//
//  Created by Vincent Chau on 3/24/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ViewControllerDelegate{
    
    var items = [String]()
    
    @IBOutlet weak var reminderTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        reminderTableView.delegate = self
        reminderTableView.dataSource = self
     
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UITableViewDatasource and Delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        cell.textLabel?.text = items[indexPath.row]

        return cell
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func controller(controller: ViewController, didAddItem: String) {
        items.append(didAddItem)
        print("did call")
        self.reminderTableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController.isKindOfClass(ViewController) {
            let nextVC = segue.destinationViewController as? ViewController
            if let viewController = nextVC{
                viewController.delegate = self
                
            }
        }
    }
}
