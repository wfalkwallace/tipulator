//
//  SettingsViewController.swift
//  tipulator
//
//  Created by William Falk-Wallace on 12/31/14.
//  Copyright (c) 2014 Falk-Wallace. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipPercentageValueLow: UITextField!
    @IBOutlet weak var tipPercentageValueMiddle: UITextField!
    @IBOutlet weak var tipPercentageValueHigh: UITextField!
    @IBOutlet weak var defaultTipSelectionControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func defaultTipValuesChanged(sender: AnyObject) {
        // get selected settings
        var defaultTipPercentages =
        [
            tipPercentageValueLow.text._bridgeToObjectiveC().doubleValue / 100.0,
            tipPercentageValueMiddle.text._bridgeToObjectiveC().doubleValue / 100.0,
            tipPercentageValueHigh.text._bridgeToObjectiveC().doubleValue / 100.0
        ]
        // if you clear out the settings, you get the defaults
        if (defaultTipPercentages[0] == 0.0) {
            defaultTipPercentages[0] = 0.175
        }
        if (defaultTipPercentages[1] == 0.0) {
            defaultTipPercentages[1] = 0.2
        }
        if (defaultTipPercentages[2] == 0.0) {
            defaultTipPercentages[2] = 0.25
        }
        // update text fields with possible defaults
        tipPercentageValueLow.text = "\(defaultTipPercentages[0] * 100.0)"
        tipPercentageValueMiddle.text = "\(defaultTipPercentages[1] * 100.0)"
        tipPercentageValueHigh.text = "\(defaultTipPercentages[2] * 100.0)"
        // update segmented control titles
        defaultTipSelectionControl.setTitle(tipPercentageValueLow.text, forSegmentAtIndex:0)
        defaultTipSelectionControl.setTitle(tipPercentageValueMiddle.text, forSegmentAtIndex:1)
        defaultTipSelectionControl.setTitle(tipPercentageValueHigh.text, forSegmentAtIndex:2)
        // save the new values
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(defaultTipPercentages, forKey: "defaultTipPercentages")
        defaults.synchronize()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultTipPercentages = defaults.arrayForKey("defaultTipPercentages") as [Double]
        var defaultTip = defaults.integerForKey("defaultTipIndex")
        
        // update text fields with defaults
        tipPercentageValueLow.text = "\(defaultTipPercentages[0] * 100.0)"
        tipPercentageValueMiddle.text = "\(defaultTipPercentages[1] * 100.0)"
        tipPercentageValueHigh.text = "\(defaultTipPercentages[2] * 100.0)"
        // update segmented control titles
        defaultTipSelectionControl.setTitle(tipPercentageValueLow.text, forSegmentAtIndex:0)
        defaultTipSelectionControl.setTitle(tipPercentageValueMiddle.text, forSegmentAtIndex:1)
        defaultTipSelectionControl.setTitle(tipPercentageValueHigh.text, forSegmentAtIndex:2)
        // set default selection
        defaultTipSelectionControl.selectedSegmentIndex = defaultTip
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultTipPercentages = defaults.arrayForKey("defaultTipPercentages") as [Double]
        var defaultTip = defaultTipSelectionControl.selectedSegmentIndex

        defaults.setInteger(defaultTip, forKey: "defaultTipIndex")
        defaults.setObject(defaultTipPercentages, forKey: "defaultTipPercentages")
        defaults.synchronize()
    }

}
