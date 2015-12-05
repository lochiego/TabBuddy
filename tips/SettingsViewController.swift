//
//  SettingsViewController.swift
//  tips
//
//  Created by Eric Gonzalez on 12/4/15.
//  Copyright © 2015 Eric Gonzalez. All rights reserved.
//

import UIKit


class SettingsViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipSeg: UISegmentedControl!
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var themeSwitch: UISwitch!
    @IBOutlet weak var localeLabel: UILabel!
    @IBOutlet weak var localeButton: UIButton!
    
    private func applyTheme() {
        view.backgroundColor = getThemeBackgroundColor()
        let foregroundColor = getThemeForegroundColor()
        tipLabel.textColor = foregroundColor
        tipSeg.tintColor = getThemeSegColor()
        themeLabel.textColor = foregroundColor
        localeLabel.textColor = foregroundColor
        localeButton.tintColor = getThemeSegColor()
    }
    
    override func viewWillAppear(animated: Bool) {
        applyTheme()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tipSeg.selectedSegmentIndex = getDefaultTipIndex()
        themeSwitch.setOn(isThemeDark(), animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changedTip(sender: AnyObject) {
        setTipIndex(tipSeg.selectedSegmentIndex)
    }
    
    @IBAction func hitSwitch() {
        toggleThemeDark()
        applyTheme()
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
