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
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var themeSwitch: UISwitch!
    @IBOutlet weak var sliderView: UIView!
    @IBOutlet weak var tipSlider: UISlider!
    
    private func applyTheme() {
        let backgroundColor = getThemeBackgroundColor()
        view.backgroundColor = backgroundColor
        sliderView.backgroundColor = backgroundColor
        
        updateForegrounds(view)
        tipSlider.minimumTrackTintColor = getThemeSegColor()
    }
    
    override func viewWillAppear(animated: Bool) {
        applyTheme()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tipSlider.value = getDefaultTip()
        changedTip(tipSlider)
        
        themeSwitch.setOn(isThemeDark(), animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changedTip(slider: UISlider) {
        let newValue = roundf(slider.value)
        slider.setValue(newValue, animated: true)
        tipLabel.text = "Default Tip Amount: \(newValue)%"
        setDefaultTip(newValue)
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
