//
//  DetailViewController.swift
//  P7WhitehousePetitions
//
//  Created by Encompass on 1/20/19.
//  Copyright © 2019 exiaj9. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView: WKWebView!
    var detailItem: JsonObject?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let detailItem = detailItem else { return }
        let html = """
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style> body { font-size: 150%; text-align: center;
        
        } </style>
</head>
<body>
        <img src='https://picsum.photos/200/300'>
<h2>\(detailItem.description)<h2>
</body>
</html>
"""
        
        webView.loadHTMLString(html, baseURL: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
