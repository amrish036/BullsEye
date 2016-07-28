//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Amrish Mahesh on 27/07/2016.
//  Copyright © 2016 Amrish Mahesh. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
  @IBAction func close(sender: UIButton) {
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  @IBOutlet weak var webView: UIWebView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if let htmlFile = NSBundle.mainBundle().pathForResource("BullsEye",
                                                            ofType: "html") {
      if let htmlData = NSData(contentsOfFile: htmlFile) {
        let baseURL = NSURL(fileURLWithPath:
          NSBundle.mainBundle().bundlePath)
        webView.loadData(htmlData, MIMEType: "text/html",
                         textEncodingName: "UTF-8", baseURL: baseURL)
      }
    }
  }
  

}
