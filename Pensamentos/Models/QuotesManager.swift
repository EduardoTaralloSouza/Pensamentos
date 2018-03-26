//
//  QuotesManager.swift
//  Pensamentos
//
//  Created by Eduardo Tarallo on 21/03/2018.
//  Copyright © 2018 Eduardo Tarallo. All rights reserved.
//

import Foundation

class QuotesManager {
    
    let quotes: [Quote]
    
    init(){
        
        // Acessando o caminho do meu arquivo JSON atraves do BUNDLE
        let fileURL = Bundle.main.url(forResource: "quotes", withExtension: "json")!
        
        //Transformando o arquivo JSON em Bytes
        let jsonData = try! Data(contentsOf: fileURL)
        
        // Decodificando meu arquivo JSON para um Array quote
        let jsonDecoder = JSONDecoder()
        quotes = try! jsonDecoder.decode([Quote].self, from: jsonData)
    }
    
    //Método para gerar um Quote aleatorio
    func getRandomQuote() -> Quote {
        let index = Int (arc4random_uniform(UInt32(quotes.count)))
        return quotes[index]
    }
    
}
