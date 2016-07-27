//
//  ViewController.swift
//  BullsEye
//
//  Created by Amrish Mahesh on 27/07/2016.
//  Copyright © 2016 Amrish Mahesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var currentValue = 0

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  @IBAction func showAlert() {
    let alert = UIAlertController(title: "Hello, World",
                                  message: "This is my first app!",
                                  preferredStyle: .Alert)
    let action = UIAlertAction(title: "Awesome", style: .Default,
                               handler: nil)
    alert.addAction(action)
    presentViewController(alert, animated: true, completion: nil)
  }

  @IBAction func sliderMoved(slider: UISlider) {
    print("The value of the slider is now: \(slider.value)");
  }
}

