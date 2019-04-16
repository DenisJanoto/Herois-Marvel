//
//  ViewController.swift
//  HeroisMarvel
//
//  Created by Denis Janoto on 27/03/2019.
//  Copyright © 2019 Denis Janoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tfNames: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    // ESCONDE A BARRA DE TITULO
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setToolbarHidden(true, animated: false)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! HeroesTableViewController
        tfNames.resignFirstResponder()//Esconde teclado
        vc.name = tfNames.text
    }
    
    
    
    @IBAction func btBuscar(_ sender: UIButton) {
    }
    
    
}

