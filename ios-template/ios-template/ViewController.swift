//
//  ViewController.swift
//  ios-template
//
//  Created by Arthur Carabott on 14/06/2017.
//  Copyright © 2017 Arthur Carabott. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate, UIScrollViewDelegate {

  var webView: WKWebView!

  override func loadView() {
    let webConfiguration = WKWebViewConfiguration()
    webConfiguration.preferences.javaScriptEnabled = true
    webConfiguration.allowsInlineMediaPlayback = true;
    webView = WKWebView(frame: .zero, configuration: webConfiguration)
    webView.uiDelegate = self
    webView.scrollView.delegate = self
    view = webView
  }

  func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    return nil
  }

  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    if scrollView.contentOffset.x != 0 {
      scrollView.contentOffset.x = 0
    }
    if scrollView.contentOffset.y != 0 {
      scrollView.contentOffset.y = 0
    }
  }

  override var prefersStatusBarHidden: Bool {
    return true
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    let myURL = URL(string: "http://pi3.local:5000/")
    let myRequest = URLRequest(url: myURL!)
    webView.load(myRequest)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}
