//
//  WebViewController.swift
//  flix
//
//  Created by Kweku Aboagye on 10/19/20.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {
    
    @IBOutlet var webView: WKWebView!
    
    //var movie: [String: Any]!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let id = movie["id"] as! String
        //print(id)
        
        //let key = String()

        // Do any additional setup after loading the view.
        let myURL = URL(string:"https://www.google.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
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

    
