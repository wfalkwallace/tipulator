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
    @IBOutlet weak var tipPercentageSelectorLow: UIButton!
    @IBOutlet weak var tipPercentageSelectorHighlightLow: UIView!
    @IBOutlet weak var tipPercentageValueHigh: UITextField!
    @IBOutlet weak var tipPercentageSelectorHigh: UIButton!
    @IBOutlet weak var tipPercentageSelectorHighlightHigh: UIView!
    @IBOutlet weak var defaultSplitSelectionControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // get the stored defaults
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultTipPercentages = defaults.arrayForKey("defaultTipPercentages") as [Double]
        var defaultTipIndex = defaults.integerForKey("defaultTipIndex")
        var defaultSplitIndex = defaults.integerForKey("defaultSplitIndex")
        
        // update text fields with defaults
        tipPercentageValueLow.text = String(format:"%g", defaultTipPercentages[0] * 100.0)
        tipPercentageValueHigh.text = String(format:"%g", defaultTipPercentages[1] * 100.0)
        
        // update button selector titles and layout
        tipPercentageSelectorLow.setTitle(tipPercentageValueLow.text, forState: UIControlState())
        tipPercentageSelectorHigh.setTitle(tipPercentageValueHigh.text, forState: UIControlState())
        tipPercentageSelectorHighlightLow.layer.cornerRadius = 10
        tipPercentageSelectorHighlightHigh.layer.cornerRadius = 10
        
        // set default selections
        defaultTipIndex == 0 ? lowTipSelected(self) : highTipSelected(self)
        defaultSplitSelectionControl.selectedSegmentIndex = defaultSplitIndex
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func defaultTipValuesChanged(sender: AnyObject) {
        // get selected settings
        var defaultTipPercentages = [
            tipPercentageValueLow.text._bridgeToObjectiveC().doubleValue / 100.0,
            tipPercentageValueHigh.text._bridgeToObjectiveC().doubleValue / 100.0
        ]
        
        // if you clear out the settings, you get the defaults
        defaultTipPercentages[0] = defaultTipPercentages[0] == 0.0 ? 0.2 : defaultTipPercentages[0]
        defaultTipPercentages[1] = defaultTipPercentages[1] == 0.0 ? 0.25 : defaultTipPercentages[1]

        // update text fields with possible defaults
        tipPercentageValueLow.text = String(format:"%g", defaultTipPercentages[0] * 100.0)
        tipPercentageValueHigh.text = String(format:"%g", defaultTipPercentages[1] * 100.0)
        
        tipPercentageSelectorLow.setTitle(tipPercentageValueLow.text, forState: UIControlState())
        tipPercentageSelectorHigh.setTitle(tipPercentageValueHigh.text, forState: UIControlState())
    }
    
    @IBAction func lowTipSelected(sender: AnyObject) {
        tipPercentageSelectorHigh.selected = false
        tipPercentageSelectorLow.selected = true
        
        tipPercentageSelectorHighlightHigh.backgroundColor = UIColor(red:0.35, green:0.47, blue:0.6, alpha:0)
        tipPercentageSelectorHighlightLow.backgroundColor = UIColor(red:0.35, green:0.47, blue:0.6, alpha:1)
    }
    
    @IBAction func highTipSelected(sender: AnyObject) {
        tipPercentageSelectorLow.selected = false
        tipPercentageSelectorHigh.selected = true
        
        tipPercentageSelectorHighlightLow.backgroundColor = UIColor(red:0.35, green:0.47, blue:0.6, alpha:0)
        tipPercentageSelectorHighlightHigh.backgroundColor = UIColor(red:0.35, green:0.47, blue:0.6, alpha:1)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        // get values to save
        var defaultTipPercentages = [
            tipPercentageValueLow.text._bridgeToObjectiveC().doubleValue / 100.0,
            tipPercentageValueHigh.text._bridgeToObjectiveC().doubleValue / 100.0
        ]
        var defaultTipIndex = tipPercentageSelectorLow.selected ? 0 : 1
        var defaultSplitIndex = defaultSplitSelectionControl.selectedSegmentIndex
        
        
        // save the defaults
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultTipIndex, forKey: "defaultTipIndex")
        defaults.setInteger(defaultSplitIndex, forKey: "defaultSplitIndex")
        defaults.setObject(defaultTipPercentages, forKey: "defaultTipPercentages")
        defaults.synchronize()
    }

    @IBAction func editingDidBegin(sender: UITextField) {
        sender.text = ""
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}
