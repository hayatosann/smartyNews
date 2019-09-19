//
//  News1ViewController.swift
//  smartyNews
//
//  Created by hayatosann on 2019/09/12.
//  Copyright © 2019 hayatosann. All rights reserved.
//

import UIKit
import WebKit


class News1ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,WKUIDelegate,XMLParserDelegate {

    var tableView:UITableView = UITableView()
    
    var refreshControl:UIRefreshControl!
    
    var webView:WKWebView = WKWebView()
    
    var goButton:UIButton!
    
    var backButton:UIButton!
    
    var cancelButton:UIButton!
    
    var dotsView:DotsLoader! = DotsLoader()
    
    var parser = XMLParser()
    var totalBox = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = String()
    var titleString = NSMutableString()
    var linkString = NSMutableString()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景画像を作る
        let imageView = UIImageView()
        imageView.frame = self.view.bounds
        imageView.image = UIImage(named: "1.jpg")
        self.view.addSubview(imageView)
        
        //引っ張って更新
        refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor.white
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        
        // tableViewを作成する
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height - 54.0)
        tableView.backgroundColor = UIColor.clear
        tableView.addSubview(refreshControl)
        self.view.addSubview(tableView)
        
        //webView
        webView.frame = tableView.frame
        webView.uiDelegate = self
//        webView.scalesPageToFit = true
        webView.contentMode = .scaleAspectFit
        self.view.addSubview(webView)
        webView.isHidden = true
        
        // 1つ進むボタン
        goButton = UIButton()
        goButton.frame = CGRect(x: self.view.frame.size.width - 50 , y: self.view.frame.size.height - 128, width: 50 , height: 50 )
        goButton.setImage(UIImage(named:"go.png"), for: .normal)
        goButton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        self.view.addSubview(goButton)
        
        //戻るボタン
        backButton = UIButton()
        backButton.frame = CGRect(x: 10, y: self.view.frame.size.height - 128, width: 50, height: 50)
        backButton.setImage(UIImage(named:"back.png"), for: .normal)
        backButton.addTarget(self, action: #selector(backPage), for: .touchUpInside)
        self.view.addSubview(backButton)
        
        //キャンセルボタン
        cancelButton = UIButton()
        cancelButton.frame = CGRect(x: 10, y: 80, width: 50, height: 50)
        cancelButton.setImage(UIImage(named:"cancel.png"), for: .normal)
        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        self.view.addSubview(cancelButton)
        
        goButton.isHidden = true
        backButton.isHidden = true
        cancelButton.isHidden = true
        
        // ドッツビュー
        dotsView.frame = CGRect(x: 0, y: self.view.frame.size.height/3, width: self.view.frame.size.width, height: 100)
        dotsView.dotsCount = 5
        dotsView.dotsRadius = 10
        self.view.addSubview(dotsView)
        
        dotsView.isHidden = true
        
        // xmlを解析する(パース)
        let url:String = "http://news.yahoo.co.jp/pickup/domestic/rss.xml"
        let urlToSend:URL = URL(string:url)!
        parser = XMLParser(contentsOf: urlToSend)!
        totalBox = []
        parser.delegate = self
        parser.parse()
        tableView.reloadData()
        
        
    }
    
    @objc func refresh(){
        perform(#selector(delay), with: nil, afterDelay: 2.0)
    }
    
    @objc func delay(){
        let url:String = "http://news.yahoo.co.jp/pickup/domestic/rss.xml"
        let urlToSend:URL = URL(string:url)!
        parser = XMLParser(contentsOf: urlToSend)!
        totalBox = []
        parser.delegate = self
        parser.parse()
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    @objc func nextPage(){
        
    }
    
    @objc func backPage(){
        
    }
    
    @objc func cancel(){
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalBox.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.text = (totalBox[indexPath.row] as AnyObject).value(forKey: "title") as? String
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 15.0)
        cell.textLabel?.textColor = UIColor.white
        
        cell.detailTextLabel?.text = (totalBox[indexPath.row] as AnyObject).value(forKey: "link") as? String
        cell.detailTextLabel?.font = UIFont.boldSystemFont(ofSize: 9.0)
        cell.detailTextLabel?.textColor = UIColor.white
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //webviewを表示する
        let linkURL = (totalBox[indexPath.row] as AnyObject).value(forKey: "link") as? String
        let urlStr = linkURL?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url:URL = URL(string:urlStr!)!
        let urlRequest = NSURLRequest(url: url)
        webView.load(urlRequest as URLRequest)
        
        
    }
    
    func webViewDidStartLoad(_ webView: WKWebView) {
        dotsView.isHidden = false
        dotsView.startAnimating()
    }

    func webViewDidFinishLoad(_ webView: WKWebView) {
        dotsView.isHidden = true
        dotsView.stopAnimating()
        webView.isHidden = false
        goButton.isHidden = false
        cancelButton.isHidden = false
        
    }
    
    // タグを見つけた時
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if element == "item"{
            
            elements = NSMutableDictionary()
            elements = [:]
            titleString = NSMutableString()
            titleString = ""
            linkString = NSMutableString()
            linkString = ""
        }
    }
    // タグの間にデータがあった時(開始タグと終了タグで括られた箇所にデータが存在した時に実行されるメソッド)
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if element == "title"{
            titleString.append(string)
        }else if element == "link"{
            linkString.append(string)
        }
    }
    
    // タグの終了を見つけた時
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
