//
//  SettingsViewController.swift
//  tips
//
//  Created by Eric Gonzalez on 12/4/15.
//  Copyright © 2015 Eric Gonzalez. All rights reserved.
//

import UIKit

let DEFAULT_TIP_KEY = "defaultTipIndex"

let tipPercentages = [0.18, 0.20, 0.22]

func getDefaultTipIndex() -> Int {
    let defaults = NSUserDefaults.standardUserDefaults()
    return defaults.integerForKey(DEFAULT_TIP_KEY)
}

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipSeg: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tipSeg.selectedSegmentIndex = getDefaultTipIndex()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changedTip(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(tipSeg.selectedSegmentIndex, forKey: DEFAULT_TIP_KEY)
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
