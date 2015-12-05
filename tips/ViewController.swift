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
    
    private func applyTheme() {
        view.backgroundColor = getThemeBackgroundColor()
        let foregroundColor = getThemeForegroundColor()
        billLabel.textColor = foregroundColor
        billField.textColor = foregroundColor
        tipTitleLabel.textColor = foregroundColor
        tipLabel.textColor = foregroundColor
        totalTitleLabel.textColor = foregroundColor
        totalLabel.textColor = foregroundColor
        tipSeg.tintColor = getThemeSegColor()

        billField.attributedPlaceholder = NSAttributedString(string: currencyFormatter.currencySymbol, attributes: [NSForegroundColorAttributeName:foregroundColor])
    }
    
    override func viewWillAppear(animated: Bool) {
        applyTheme()
    }
    
    var currencyFormatter: NSNumberFormatter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        currencyFormatter = NSNumberFormatter()
        currencyFormatter.numberStyle = .CurrencyStyle
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.alwaysShowsDecimalSeparator = false
        
        let cachedAmount = getCachedBill()
        billField.text = cachedAmount == 0 ? "" : String(format:"%.2f", cachedAmount)
        billChanged()
    }
    
    override func viewDidAppear(animated: Bool) {
        tipSeg.selectedSegmentIndex = getDefaultTipIndex()
        billChanged()
        billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func billChanged() {
        let billText = billField.text!

        if (valuesHidden != billText.isEmpty) {
            valuesHidden = !valuesHidden
            updateVisibility(valuesHidden)
            
            billField.attributedPlaceholder = NSAttributedString(string: currencyFormatter.currencySymbol, attributes: [NSForegroundColorAttributeName:getThemeForegroundColor()])
        }
        
        let billAmount = (billText as NSString).doubleValue
        let tip = billAmount * tipPercentages[tipSeg.selectedSegmentIndex]
        let total = billAmount + tip
        
        tipLabel.text = currencyFormatter.stringFromNumber(tip)
        totalLabel.text = currencyFormatter.stringFromNumber(total)
        
        updateCachedBill(billAmount)
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
            view.endEditing(true)
    }
    
}

