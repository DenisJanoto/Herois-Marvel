//
//  MarvelAPI.swift
//  
//
//  Created by Denis Janoto on 30/03/2019.
//

import Foundation
import SwiftHash
import Alamofire

class MarvelAPI{
    //CLASSE RESPONSAVEL PELA LÓGICA API
    
    static private let basePath = "https://gateway.marvel.com/v1/public/characters?"
    static private let privatekey = "ca27a013adcb26bf5baea6680f27fb4718547da8"
    static private let publickey = "7dfaed21eba2cea1e0b3681bd9108af5"
    static private let limit = 50
    
    
    
    class func loadHeroes(name:String?,page: Int=0,onComplete:@escaping(marvelInfo?)->Void){
        let offset = page*limit
        let startsWith:String
        if let name = name,!name.isEmpty{
            startsWith = "nameStartsWith=\(name.replacingOccurrences(of: " ", with: ""))&"
        }else{
            startsWith = ""
        }
        let url = basePath + "offset=\(offset)&limit=\(limit)&" + startsWith + getCredentials()
        Alamofire.request(url).responseJSON { (response) in
            guard let data = response.data else{
                onComplete(nil)
                return
            }
            
            guard let marvelInfo = try? JSONDecoder().decode(marvelInfo.self, from: data)else{
                onComplete(nil)
                return
            }
            if marvelInfo.code == 200{
            }else{
                onComplete(nil)
                print("ERRO STATUS CODE")
            }    
            onComplete(marvelInfo)
        }
        
        
    }
    
    
    private class func getCredentials()->String{
        //Retorna uma data aleatoria entre 1970 e ano atual(api marvel exige isso na chamada)
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(ts+privatekey+publickey).lowercased()
        return "ts=\(ts)&apikey=\(publickey)&hash=\(hash)"//URL para acessar a api
        
    }
    
}
