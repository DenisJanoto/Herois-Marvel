//
//  HeroesTableViewCell.swift
//  HeroisMarvel
//
//  Created by Denis Janoto on 30/03/2019.
//  Copyright © 2019 Denis Janoto. All rights reserved.
//

import UIKit
import Kingfisher

class HeroesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ivThumb: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func prepareCell(with hero:Hero){
        
        lbName.text = hero.name
        lbDescription.text = hero.description
        
        //FAZ O DOWNLOAD DA IMAGEM ATRAVEZ DE UMA URL E COLOCA NA IMAGEVIEW ATRAVÉZ DO FRAMEWORK KINGFISHER
        if let url = URL.init(string:hero.thumbnail.url){
            let resource = ImageResource(downloadURL: url, cacheKey: hero.thumbnail.url)
            ivThumb.kf.indicatorType = .activity //Placeholder nas imagens antes de carregar
            ivThumb.kf.setImage(with: resource)
            
        }else{
            ivThumb.image = nil
        }
        
        ivThumb.layer.cornerRadius = ivThumb.frame.size.height/2 //Deixa imagem redonda
        
    }
    
}
