//
//  TodayViewController.swift
//  SafeDriver Today
//
//  Created by Isaac M on 13/06/15.
//  Copyright (c) 2015 Isaac Mercer. All rights reserved.
//

import UIKit
import NotificationCenter
import WebKit

class TodayViewController: UIViewController, NCWidgetProviding {

//    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        /*self.webView = WKWebView()
        self.view = self.webView
        var url = NSURL(string:"http://www.kinderas.com/")
        var req = NSURLRequest(URL:url!)
        self.webView!.loadRequest(req)*/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.NewData)
    }
    
}
