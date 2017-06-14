//
//  ViewController.swift
//  ios-template
//
//  Created by Arthur Carabott on 14/06/2017.
//  Copyright © 2017 Arthur Carabott. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {

  var webView: WKWebView!

  override func loadView() {
    let webConfiguration = WKWebViewConfiguration()
    webConfiguration.preferences.javaScriptEnabled = true

    webView = WKWebView(frame: .zero, configuration: webConfiguration)
    webView.uiDelegate = self
    view = webView
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    let myURL = URL(string: "http://ac.local:8080/")
    let myRequest = URLRequest(url: myURL!)
    webView.load(myRequest)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}

