//
//  SettingsViewController.swift
//  tipulator
//
//  Created by William Falk-Wallace on 12/30/14.
//  Copyright (c) 2014 William Falk-Wallace. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var defaultTipPercentages = [0.18, 0.2, 0.22]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("WFW")

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        //        super.viewWillAppear(animated)
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultTip = defaults.doubleForKey("defaultTip")
    }
    
    override func viewWillDisappear(animated: Bool) {
        //        super.viewWillDisappear(animated)
        var defaultTip = defaultTipPercentages[defaultTipControl.selectedSegmentIndex]
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(defaultTip, forKey: "defaultTip")
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