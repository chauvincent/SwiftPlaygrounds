//
//  ViewController.swift
//  UnitTestingExercise
//
//  Created by Vincent Chau on 8/30/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let math = Math.instance
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(math.sum(10, b: 10))
        getScore()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func getScore() {
        print(math.sum(5, b: 5))
    }

}

