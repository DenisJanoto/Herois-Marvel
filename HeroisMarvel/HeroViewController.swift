//
//  HeroViewController.swift
//  HeroisMarvel
//
//  Created by Denis Janoto on 02/04/2019.
//  Copyright © 2019 Denis Janoto. All rights reserved.
//

import UIKit
import WebKit

class HeroViewController: UIViewController {

    @IBOutlet weak var webview: WKWebView!
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    var heroes:Hero!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //CONFIGURAÇÕES DO WEBVVIEW
            let url = URL(string: (heroes.urls.first?.url)!)//Url da pagina
            let request = URLRequest(url: url!)
            title = self.heroes.name
            webview.allowsBackForwardNavigationGestures = true // Navegar para cima e para baixo sem precisar de botoes
            webview.navigationDelegate = self
            webview.load(request)
    }
}

extension HeroViewController:WKNavigationDelegate{
    
    //Metodo chamado quando a pagina terminar de carregar
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loading.stopAnimating()
    }
}
