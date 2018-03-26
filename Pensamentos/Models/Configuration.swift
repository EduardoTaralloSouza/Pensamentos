//
//  Configuration.swift
//  Pensamentos
//
//  Created by Eduardo Tarallo on 21/03/2018.
//  Copyright © 2018 Eduardo Tarallo. All rights reserved.
//

import Foundation


enum UserDefaultsKeys: String {
    case timeInterval = "timeInterval"
    case colorScheme  = "colorScheme"
    case autorefresh  = "autorefresh"
}


class Configuration {
    
    //Acessando a persistencia de Dados UserDefaults
    let defaults = UserDefaults.standard
    
    /*
     Singleton é um padrão de projeto de software (do inglês Design Pattern).
     Este padrão garante a existência de apenas uma instância de uma classe,
     mantendo um ponto global de acesso ao seu objeto.
    */
    static var shared: Configuration = Configuration()
    
    
    // ***** Propriedades computadas *****
    
    var timeInterval: Double{
        
        // Recuperar uma informação que está no UserDefaults (recuperar a informação)
        get {
            return defaults.double(forKey: UserDefaultsKeys.timeInterval.rawValue)
        }
        // Persistir uma informação no UserDefaults(gravar a informação)
        set {
            defaults.set(newValue, forKey: UserDefaultsKeys.timeInterval.rawValue)
        }
    }
    
    var colorScheme: Int {
        get {
            return defaults.integer(forKey: UserDefaultsKeys.colorScheme.rawValue)
        }
        set {
            defaults.set(newValue, forKey: UserDefaultsKeys.colorScheme.rawValue)
        }
    }
    
    var autorefresh: Bool {
        get {
            return defaults.bool(forKey: UserDefaultsKeys.autorefresh.rawValue)
        }
        set {
            defaults.set(newValue, forKey: UserDefaultsKeys.autorefresh.rawValue)
        }
    }
    
    
    // ***** Método Construtor da Classe *****
    
    private init() {
        if defaults.double(forKey: UserDefaultsKeys.timeInterval.rawValue) == 0 {
            
            defaults.set(15.0, forKey: UserDefaultsKeys.timeInterval.rawValue)
        }
    }
    
}
