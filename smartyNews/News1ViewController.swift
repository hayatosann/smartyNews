//
//  News1ViewController.swift
//  smartyNews
//
//  Created by hayatosann on 2019/09/12.
//  Copyright © 2019 hayatosann. All rights reserved.
//

import UIKit
import WebKit

class News1ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView:UITableView = UITableView()
    
    var refreshControl:UIRefreshControl!
    
    var webView:WKWebView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景画像を作る
        let imageView = UIImageView()
        imageView.frame = self.view.bounds
        // Do any additional setup after loading the view.
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
