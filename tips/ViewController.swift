//
//  ViewController.swift
//  tips
//
//  Created by Eric Gonzalez on 12/4/15.
//  Copyright © 2015 Eric Gonzalez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipTitleLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var totalTitleLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSeg: UISegmentedControl!
    
    var valuesHidden = true
    
    private func updateVisibility(hide: Bool) {
        let alpha: CGFloat = hide ? 0 : 1
        UIView.animateWithDuration(0.35) { () -> Void in
            self.tipTitleLabel.alpha = alpha
            self.tipLabel.alpha = alpha
            self.separatorView.alpha = alpha
            self.totalTitleLabel.alpha = alpha
            self.totalLabel.alpha = alpha
            self.tipSeg.alpha = alpha
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
                
        billField.becomeFirstResponder()
    }
    
    override func viewDidAppear(animated: Bool) {
        tipSeg.selectedSegmentIndex = getDefaultTipIndex()
        billChanged(0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    let tipPercentages = [0.18, 0.20, 0.22]
    
    @IBAction func billChanged(sender: AnyObject) {
        let tipText = billField.text!
        if (valuesHidden != tipText.isEmpty) {
            valuesHidden = !valuesHidden
            updateVisibility(valuesHidden)
        }
        
        let billAmount = (tipText as NSString).doubleValue
        let tip = billAmount * tipPercentages[tipSeg.selectedSegmentIndex]
        let total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func dismissKeyboard(sender: AnyObject) {
            view.endEditing(true)
    }
    
}

