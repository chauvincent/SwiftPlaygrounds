//
//  ViewController.swift
//  NSCodingProtocolPractice
//
//  Created by Vincent Chau on 3/24/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var reminderTextField: UITextField!
    @IBOutlet weak var rememberLaterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reminderTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// MARK: IBActions
    @IBAction func didPressButton(sender: AnyObject) {
        reminderTextField.text = "Default"
    }
    
// MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        rememberLaterLabel.text = textField.text 
    }

}

