//
//  HeroesTableViewController.swift
//  HeroisMarvel
//
//  Created by Denis Janoto on 30/03/2019.
//  Copyright © 2019 Denis Janoto. All rights reserved.
//

import UIKit

class HeroesTableViewController: UITableViewController {
    
    var name:String?
    var heroes:[Hero]=[]
    var loadingHeroes = false
    var currentPage = 0
    var total = 0
    
    //Criacao de uma label via codigo
    var label:UILabel{
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        
        return label
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Carregando, aguarde.."
        tableView.backgroundColor = .black
        loadHeros()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setToolbarHidden(false, animated: false)
    }
    //Pede os herois para a API
    func loadHeros(){
        loadingHeroes = true
        
        MarvelAPI.loadHeroes(name: name, page: currentPage) { (info) in
            if let info = info{
                
                self.heroes+=info.data.results
                self.total=info.data.total
                DispatchQueue.main.async {
                    self.loadingHeroes = false
                    self.label.text = "Não foram encontrados heróis com o nome \(self.name!)"
                    self.tableView.reloadData()
                }
            }else{
                print("erro")
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundView = heroes.count == 0 ? label: nil
        return heroes.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HeroesTableViewCell
        
        let hero = heroes[indexPath.row]
        cell.prepareCell(with: hero)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! HeroViewController
        vc.heroes = heroes[(tableView.indexPathForSelectedRow?.row)!]
    }
    
    //METODO CHAMADO ANTES DA TABLEVIEW MOSTRAR UMA CELULA
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //CRIANDO SCROW INFINITO
        
        //Quando estiver chegando no final da tableView(heroes.count - 10) && não estiver carregando nada    (!loadingHeroes) && não estiver chegado no total de herois (heroes.count != total)
        if indexPath.row == heroes.count - 10 &&  !loadingHeroes && heroes.count != total{
            currentPage+=1
            loadHeros()
        }
    }
    
}
