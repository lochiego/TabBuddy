//
//  ViewController.swift
//  tips
//
//  Created by Eric Gonzalez on 12/4/15.
//  Copyright © 2015 Eric Gonzalez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSeg: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func billChanged(sender: AnyObject) {
        let billAmount = (billField.text! as NSString).doubleValue
        let tipPercentages = [0.18, 0.20, 0.22]
        let tip = billAmount * tipPercentages[tipSeg.selectedSegmentIndex]
        let total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func dismissKeyboard(sender: AnyObject) {
            view.endEditing(true)
    }
    
}

