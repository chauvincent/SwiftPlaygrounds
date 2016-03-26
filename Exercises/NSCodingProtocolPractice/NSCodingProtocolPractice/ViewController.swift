//
//  ViewController.swift
//  NSCodingProtocolPractice
//
//  Created by Vincent Chau on 3/24/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import UIKit

protocol  ViewControllerDelegate {
    func controller(controller: ViewController, didAddItem:String)
}

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var reminderTextField: UITextField!
    @IBOutlet weak var rememberLaterLabel: UILabel!
    
    var delegate: ViewControllerDelegate?
    
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
        
        if let delegate = self.delegate{
            delegate.controller(self, didAddItem: textField.text as String!)
        }
    }

}

