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
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var sliderView: UIView!
    
    var valuesHidden = true
    
    private func updateVisibility(hide: Bool) {
        let alpha: CGFloat = hide ? 0 : 1
        UIView.animateWithDuration(0.35) { () -> Void in
            self.tipTitleLabel.alpha = alpha
            self.tipLabel.alpha = alpha
            self.separatorView.alpha = alpha
            self.totalTitleLabel.alpha = alpha
            self.totalLabel.alpha = alpha
            self.sliderView.alpha = alpha
        }
    }
    
    private func applyTheme() {
        let backgroundColor = getThemeBackgroundColor()
        view.backgroundColor = backgroundColor
        sliderView.backgroundColor = backgroundColor
        
        updateForegrounds(view)
        let currencySymbol = currencyFormatter.currencySymbol
        print(currencySymbol)
        billField.attributedPlaceholder = NSAttributedString(string: currencySymbol, attributes: [NSForegroundColorAttributeName:UIColor ( red: 0.498, green: 0.498, blue: 0.498, alpha: 1.0 )])
        tipSlider.minimumTrackTintColor = getThemeSegColor()
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
        tipSlider.value = getDefaultTip()
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
        }
        
        let billAmount = (billText as NSString).doubleValue
        let tipPercent = Int(tipSlider.value)
        let tip = billAmount * Double(tipPercent) * 0.01
        let total = billAmount + tip
        
        tipLabel.text = currencyFormatter.stringFromNumber(tip)
        tipTitleLabel.text = "Tip (\(tipPercent)%)"
        totalLabel.text = currencyFormatter.stringFromNumber(total)
        
        updateCachedBill(billAmount)
    }
    
    @IBAction func sliderChanged(slider: UISlider) {
        let newValue = roundf(slider.value)
        slider.setValue(newValue, animated: true)
        billChanged()
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
            view.endEditing(true)
    }
    
}

