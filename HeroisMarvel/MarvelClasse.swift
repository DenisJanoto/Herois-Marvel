//
//  MarvelClasse.swift
//  HeroisMarvel
//
//  Created by Denis Janoto on 30/03/2019.
//  Copyright © 2019 Denis Janoto. All rights reserved.
//

import Foundation

//Classe responsável pela variáveis de recebimento das informaçõe do JSON

struct marvelInfo:Codable{
    
    let code:Int
    let status:String
    let data:marvelData
}

struct marvelData:Codable{
    let offset:Int
    let limit:Int
    let total:Int
    let count:Int
    let results:[Hero]
}


struct Hero:Codable{
    let id:Int
    let name:String
    let description:String
    let thumbnail:thumbnail
    let urls:[HeroURL]
}

struct thumbnail:Codable {
    let path:String
    let ext:String
    
    var url:String{
        return path + "." + ext
    }
    
    //EXTENSION É UMA PROPRIEDADE RESERVADO DO SWIFT, ENTAO É PRECISO CRIAR O ENUM ABAIXO E DIZER QUE A VARIAVEL EXT SERÁ VISTA COMO EXTENSION
    enum CodingKeys:String,CodingKey{
        case path
        case ext = "extension"
    }
}

struct HeroURL:Codable {
    let type:String
    let url:String
}











