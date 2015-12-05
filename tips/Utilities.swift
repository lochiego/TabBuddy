//
//  Tips.swift
//  tips
//
//  Created by Eric Gonzalez on 12/4/15.
//  Copyright © 2015 Eric Gonzalez. All rights reserved.
//

import Foundation
import UIKit

private let DEFAULT_TIP_KEY = "defaultTipIndex"
private let DEFAULT_THEME_KEY = "defaultTheme"
private let CACHE_EXPIRY_KEY = "expiryDate"
private let CACHE_BILL_KEY = "cachedBill"
private let cacheExpiryMins = 10.0

let tipPercentages = [0.18, 0.20, 0.22]
let defaults = NSUserDefaults.standardUserDefaults()

func getDefaultTipIndex() -> Int {
    return defaults.integerForKey(DEFAULT_TIP_KEY)
}

func setTipIndex(index: Int) {
    defaults.setInteger(index, forKey: DEFAULT_TIP_KEY)
    defaults.synchronize()
}

func isThemeDark() -> Bool {
    return defaults.boolForKey(DEFAULT_THEME_KEY)
}

func toggleThemeDark() {
    defaults.setBool(!isThemeDark(), forKey: DEFAULT_THEME_KEY)
    defaults.synchronize()
}

func getThemeBackgroundColor() -> UIColor {
    return isThemeDark() ? UIColor ( red: 0.298, green: 0.298, blue: 0.298, alpha: 1.0 ) : UIColor.whiteColor()
}

func getThemeForegroundColor() -> UIColor {
    return isThemeDark() ? UIColor.lightTextColor() : UIColor.darkTextColor()
}

func getThemeSegColor() -> UIColor? {
    return isThemeDark() ? UIColor.greenColor() : nil
}

func getCachedBill() -> Double {
    let expiryDate = defaults.doubleForKey(CACHE_EXPIRY_KEY)
    return expiryDate < NSDate().timeIntervalSince1970 ? 0.0 : defaults.doubleForKey(CACHE_BILL_KEY)
}

func updateCachedBill(amount: Double) {
    defaults.setDouble(amount, forKey: CACHE_BILL_KEY)
    defaults.setDouble(NSDate().timeIntervalSince1970 + 60 * cacheExpiryMins, forKey: CACHE_EXPIRY_KEY)
    defaults.synchronize()
}
