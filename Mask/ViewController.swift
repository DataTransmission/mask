//
//  ViewController.swift
//  Mask
//
//  Created by Jack Cook on 3/8/15.
//  Copyright (c) 2015 Jack Cook. All rights reserved.
//

import Alamofire
import UIKit

class ViewController: UIViewController {

    @IBOutlet var advertisementSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func switchChanged(sender: AnyObject) {
        let on = advertisementSwitch.on ? "off" : "on"
        request(.GET, "http://104.131.190.96:8080/ads\(on)")
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}
