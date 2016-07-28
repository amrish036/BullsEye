//
//  ViewController.swift
//  BullsEye
//
//  Created by Amrish Mahesh on 27/07/2016.
//  Copyright © 2016 Amrish Mahesh. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
  var currentValue = 0
  var targetValue = 0
  var score = 0
  var rounds = 0
  
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var roundLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    startNewGame()
    updateLabels()
    
    let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
    slider.setThumbImage(thumbImageNormal, forState: .Normal)
    let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
    slider.setThumbImage(thumbImageHighlighted, forState: .Highlighted)
    let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    if let trackLeftImage = UIImage(named: "SliderTrackLeft") {
      let trackLeftResizable =
        trackLeftImage.resizableImageWithCapInsets(insets)
      slider.setMinimumTrackImage(trackLeftResizable, forState: .Normal)
    }
    if let trackRightImage = UIImage(named: "SliderTrackRight") {
      let trackRightResizable =
        trackRightImage.resizableImageWithCapInsets(insets)
      slider.setMaximumTrackImage(trackRightResizable, forState: .Normal)
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  @IBAction func showAlert() {
    var difference = abs(currentValue - targetValue)
    if difference < 0 {
      difference = difference * -1
    }
    
    var points = 100 - difference
    
    let title: String
    switch difference{
    case 0:
      title = "Perfect!"
      points += 100
    case 1..<5:
      title = "Missed it by inches!"
    case 5..<10:
      title = "Pretty good!"
    default:
      title = "Not even close!"
    }
    
    score += points
    
    let message = "You scored \(points) points"
    let alert = UIAlertController(title: title,
                                  message: message,
                                  preferredStyle: .Alert)
    let action = UIAlertAction(title: "OK", style: .Default,
                               handler: {action in self.startNewRound()
                                                    self.updateLabels()})
    alert.addAction(action)
    
    presentViewController(alert, animated: true, completion: nil)
    
  }

  @IBAction func sliderMoved(slider: UISlider) {
    currentValue = lroundf(slider.value)
    print("The value of the slider is now: \(slider.value)");
    print("current value :\(currentValue)");
  }
  
  func startNewRound() {
    rounds += 1
    targetValue = 1 + Int(arc4random_uniform(100))
    currentValue = 1+Int(arc4random_uniform(100))
    slider.value = Float(currentValue)
  }
  
  func startNewGame(){
    score = 0
    rounds = 0
    startNewRound()
  }
  
  func updateLabels() {
    targetLabel.text = String(targetValue)
    scoreLabel.text = String(score)
    roundLabel.text = String(rounds)
  }
  
  @IBAction func startOver(button: UIButton) {
    startNewGame()
    updateLabels()
    
    let transition = CATransition()
    transition.type = kCATransitionFade
    transition.duration = 1
    transition.timingFunction = CAMediaTimingFunction(name:
      kCAMediaTimingFunctionEaseOut)
    view.layer.addAnimation(transition, forKey: nil)
  }
  
}

