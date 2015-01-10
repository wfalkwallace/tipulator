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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var navigationSettingsButton:UIButton = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
//        myBackButton.addTarget(self, action: "popToRoot:", forControlEvents: UIControlEvents.TouchUpInside)
//        
//        var myCustomBackButtonItem:UIBarButtonItem = UIBarButtonItem(customView: myBackButton)
//        self.navigationItem.leftBarButtonItem = myCustomBackButtonItem
//        
//        self.navigationItem.titleView = UIImageView.initialize()
//            navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"smallWhiteLogoforStatusBar.png"]];
//        
//        [btnTwo setImage:btnImage forState:UIControlStateNormal];
//        UIImage *btnImage = [UIImage imageNamed:@"image.png"];
        
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
        var defaults = NSUserDefaults.standardUserDefaults()
        var tipPercentages = defaults.arrayForKey("defaultTipPercentages") as [Double]
        var tipPercentageIndex = lowTipSelector.selected ? 0 : 1
        var tipPercentage = tipPercentages[tipPercentageIndex]
        
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func highTipSelected(sender: AnyObject) {
        lowTipSelector.selected = false
        highTipSelector.selected = true

        lowTipSelectorHighlight.backgroundColor = UIColor(red:0.35, green:0.47, blue:0.6, alpha:0)
        highTipSelectorHighlight.backgroundColor = UIColor(red:0.35, green:0.47, blue:0.6, alpha:1)
        
        onEditingChanged(self)
    }
    
    @IBAction func lowTipSelected(sender: AnyObject) {
        highTipSelector.selected = false
        lowTipSelector.selected = true

        highTipSelectorHighlight.backgroundColor = UIColor(red:0.35, green:0.47, blue:0.6, alpha:0)
        lowTipSelectorHighlight.backgroundColor = UIColor(red:0.35, green:0.47, blue:0.6, alpha:1)
        onEditingChanged(self)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        var defaults = NSUserDefaults.standardUserDefaults()
        var tipPercentages = defaults.arrayForKey("defaultTipPercentages") as [Double]
        var tipPercentageIndex = defaults.integerForKey("defaultTipIndex")
        
        if (tipPercentageIndex == 0) {
            lowTipSelected(self)
        }
        else {
            highTipSelected(self)
        }

        lowTipSelector.setTitle(String(format:"%g%%", tipPercentages[0] * 100.0), forState:UIControlState())
        highTipSelector.setTitle(String(format:"%g%%", tipPercentages[1] * 100.0), forState:UIControlState())

        // update segmented control titles
        // tipControl.setTitle(String(format:"%g", tipPercentages[0] * 100.0), forSegmentAtIndex:0)
        // tipControl.setTitle(String(format:"%g", tipPercentages[1] * 100.0), forSegmentAtIndex:1)
        // tipControl.setTitle(String(format:"%g", tipPercentages[2] * 100.0), forSegmentAtIndex:2)
        // set default selection
        // tipControl.selectedSegmentIndex = tipPercentageIndex
    }

}

