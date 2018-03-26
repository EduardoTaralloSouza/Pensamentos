//
//  Quote.swift
//  Pensamentos
//
//  Created by Eduardo Tarallo on 21/03/2018.
//  Copyright © 2018 Eduardo Tarallo. All rights reserved.
//

import Foundation

/*
 Codable é um protocolo responsável por traduzir arquivos JSON diretamente para instancias de classe. Com esse protocolo
 podemos também transformar objetos de Swift em JSON.
 
 Codable -> Encodable / Decodable
 */

struct Quote: Codable {
    
    let quote: String
    let author: String
    let image: String
    
    //Propriedades computadas
    var quoteFormatted: String{
        return "〝" + quote + "〞"
    }
    
    var authorFormatted: String {
        return "- " + author + " -"
    }
    
}
