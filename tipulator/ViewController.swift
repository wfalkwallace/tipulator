//
//  ViewController.swift
//  tipulator
//
//  Created by William Falk-Wallace on 12/31/14.
//  Copyright (c) 2014 Falk-Wallace. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var splitControl: UISegmentedControl!
    
    @IBOutlet weak var lowTipSelector: UIButton!
    @IBOutlet weak var lowTipSelectorHighlight: UIView!
    @IBOutlet weak var highTipSelector: UIButton!
    @IBOutlet weak var highTipSelectorHighlight: UIView!
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var navigationSettingsButton: UIButton!

    var currencySymbols = ["$","£","€","¥","₹","₩"]
    var currencySymbol = "$"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipLabel.text = ""
        totalLabel.text = ""
        
        lowTipSelectorHighlight.layer.cornerRadius = 10
        highTipSelectorHighlight.layer.cornerRadius = 10
        
        billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [
            lowTipSelector.titleLabel!.text!._bridgeToObjectiveC().doubleValue / 100.0,
            highTipSelector.titleLabel!.text!._bridgeToObjectiveC().doubleValue / 100.0
        ]
        var splitValue = Double(splitControl.selectedSegmentIndex + 1)
        var tipPercentageIndex = lowTipSelector.selected ? 0 : 1
        var tipPercentage = tipPercentages[tipPercentageIndex]
        
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue / splitValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "\(tip)"
        totalLabel.text = "\(total)"
        
        tipLabel.text = String(format: "%.2f", tip)
        totalLabel.text = currencySymbol + String(format: "%.2f", total)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func editingDidBegin(sender: UITextField) {
        sender.text = ""
    }
    
    @IBAction func highTipSelected(sender: AnyObject) {
        lowTipSelector.selected = false
        highTipSelector.selected = true

        UIView.animateWithDuration(0.2, animations: {
            // This causes first view to fade in and second view to fade out
//            self.lowTipSelectorHighlight.backgroundColor = nil
//            self.highTipSelectorHighlight.backgroundColor = UIColor(red:0.35, green:0.47, blue:0.6, alpha:1)
        })
        
        onEditingChanged(self)
    }
    
    @IBAction func lowTipSelected(sender: AnyObject) {
        highTipSelector.selected = false
        lowTipSelector.selected = true

        UIView.animateWithDuration(0.2, animations: {
            // This causes first view to fade in and second view to fade out
//            self.highTipSelectorHighlight.backgroundColor = nil
//            self.lowTipSelectorHighlight.backgroundColor = UIColor(red:0.35, green:0.47, blue:0.6, alpha:1)
        })

        onEditingChanged(self)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        var defaults = NSUserDefaults.standardUserDefaults()
        var tipPercentages = defaults.arrayForKey("defaultTipPercentages") as [Double]
        var tipPercentageIndex = defaults.integerForKey("defaultTipIndex")
        var splitIndex = defaults.integerForKey("defaultSplitIndex")
        var currencySymbolIndex = defaults.integerForKey("defaultCurrencySymbolIndex")
        currencySymbol = currencySymbols[currencySymbolIndex]
        
        if (tipPercentageIndex == 0) {
            lowTipSelected(self)
        }
        else {
            highTipSelected(self)
        }

        lowTipSelector.setTitle(String(format:"%g%%", tipPercentages[0] * 100.0), forState:UIControlState())
        highTipSelector.setTitle(String(format:"%g%%", tipPercentages[1] * 100.0), forState:UIControlState())

        // set default selection
         splitControl.selectedSegmentIndex = splitIndex
    }

}

