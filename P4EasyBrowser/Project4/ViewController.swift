//
//  ViewController.swift
//  Project4
//
//  Created by Giannini Charles on 12/1/18.
//  Copyright © 2018 exiaj9. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    var progressView: UIProgressView!
    var selectedWebsite: String?
    var websites: [String]?
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationController?.navigationBar.prefersLargeTitles = false

        if let selectedWebsite = selectedWebsite {
        let url = URL(string: "https://" + selectedWebsite)!
        webView.load(URLRequest(url: url))
        }
       
        webView.allowsBackForwardNavigationGestures = true
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title:
            "Open", style: .plain, target: self, action:
            #selector(openTapped))
        
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        let progressButton = UIBarButtonItem(customView: progressView)
        
        let spacer =
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target:
                nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh,
                                      target: webView, action: #selector(webView.reload))
//        toolbarItems = [spacer, refresh]
        toolbarItems = [progressButton, spacer, refresh]
        navigationController?.isToolbarHidden = false
        
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context:
            nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context:
            nil)
    }

    override func observeValue(forKeyPath keyPath: String?, of
        object: Any?, change: [NSKeyValueChangeKey : Any]?, context:
        UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }

    
    @objc func openTapped() {
        let ac = UIAlertController(title: "Open page…", message:
            nil, preferredStyle: .actionSheet)
//        for website in websites {
//            ac.addAction(UIAlertAction(title: website, style: .default,
//                                       handler: openPage))
//        }
        ac.addAction(UIAlertAction(title: selectedWebsite, style: .default,
                                                                          handler: openPage))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.popoverPresentationController?.barButtonItem =
            self.navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let url = navigationAction.request.url
        
        if let websites = websites {
        if let host = url?.host {
            for website in websites {
                if host.contains(website){
                    decisionHandler(.allow)
                    return
                }
            }
        }
        decisionHandler(.cancel)
        }
    }
    
    func openPage(action: UIAlertAction) {
        let url = URL(string: "https://" + action.title!)!
        webView.load(URLRequest(url: url))
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
         title = webView.title
    }
}

