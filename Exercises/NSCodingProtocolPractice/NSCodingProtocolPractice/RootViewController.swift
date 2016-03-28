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
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.reminderTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController.isKindOfClass(ViewController) {
            let nextVC = segue.destinationViewController as? ViewController
            if let viewController = nextVC{
                viewController.delegate = self
            }
        }
    }
    // MARK: UITableViewDatasource and Delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Store.sharedInstance.count()
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        let item = Store.sharedInstance.objectForRowAtIndexPath(indexPath)
        cell.textLabel?.text = item.descript
        return cell
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: ViewController Delegate
    func controller(controller: ViewController, didAddItem: String) {
        Store.sharedInstance.add(Task(descript: didAddItem))
        
        //items.append(didAddItem)
        ///self.reminderTableView.reloadData()
    }
    

}