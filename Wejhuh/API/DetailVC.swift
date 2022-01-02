//
//  DetailVC.swift
//  Wejhuh
//
//  Created by Huda N S on 29/05/1443 AH.
//

import UIKit
import WebKit

class DetailVC: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    

    
    var item : Item?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        titleLabel.text = ""
//        dateLabel.text = ""
        
        guard item != nil else {
            return
        }
        
        let embedUrlString = Constents.YTembedURL + item!.snippet.resourceID.videoID
        
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        titleLabel.text = item!.snippet.title
        
        
//        let df = DateFormatter()
//        df.dateFormat = "EEEE, MMM d, yyyy"
//        dateLabel.text = df.string(from: item!.snippet.publishedAt)
    }

}
