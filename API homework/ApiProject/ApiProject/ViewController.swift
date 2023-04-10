//
//  ViewController.swift
//  ApiProject
//
//  Created by Асель Калиева on 27.02.2023.
//

import UIKit
import WebKit
//import SVProgressHUD

class ViewController: UIViewController {

    @IBOutlet weak var webview: WKWebView!
    
    var music = ITunesMusic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = URL(string: music.previewUrl)
        let urlrequest = URLRequest(url: url!)
        webview.load(urlrequest)
    }


}

