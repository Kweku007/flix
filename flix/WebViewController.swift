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
    
    var movie: [String: Any]!{
        didSet{
            let id = movie["id"] as! Int
            
            let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US")!
            getKey(url: url) { (key) in
                let trailerUrl = "https://www.youtube.com/watch?v=\(key!)"
                let myURL = URL(string:trailerUrl)
                let myRequest = URLRequest(url: myURL!)
                self.webView.load(myRequest)
            }
            
        }
        }
    
    func getKey(url: URL, completion: @escaping(String?)->()) {
        print(url.absoluteString)
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
                completion(nil)
                return
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            
            let results = dataDictionary["results"] as! [[String: Any]]
            
            let result = results.first!
            
            let key = result["key"] as! String
            
            completion(key)

           }
        }
        task.resume()
    
}


    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
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

    
