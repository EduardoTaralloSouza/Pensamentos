//
//  QuotesViewController.swift
//  Pensamentos
//
//  Created by Eduardo Tarallo on 21/03/2018.
//  Copyright © 2018 Eduardo Tarallo. All rights reserved.
//

import UIKit

class QuotesViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var ivPhoto: UIImageView!
    @IBOutlet weak var ivPhotoBg: UIImageView!
    @IBOutlet weak var lbQuote: UILabel!
    @IBOutlet weak var lbAuthor: UILabel!
    @IBOutlet weak var lcTop: NSLayoutConstraint!
    
    
    let config = Configuration.shared
    
    
    // MARK: - Propriedades
    let quotesManager = QuotesManager()
    var timer: Timer?
    

    // MARK: - Propriedades de ViewCicle
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "Refresh"), object: nil, queue: nil) { (notification) in
            
            self.formatView()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formatView()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        prepareQuotes()
    }
    
    func formatView() {
        view.backgroundColor = config.colorScheme == 0 ? .white : UIColor(red: 156.0/255.0, green: 68.0/255.0, blue: 15.0/255.0, alpha: 1.0)
        lbQuote.textColor    = config.colorScheme == 0 ? .black : .white
        lbAuthor.textColor   = config.colorScheme == 0 ?  UIColor(red: 192.0/255.0, green: 96.0/255.0, blue: 49.0/255.0, alpha: 1.0) : .white
        prepareQuotes()
    }
    
    func prepareQuotes() {
        
        //Método para interromper o temporizar anterior
        timer?.invalidate()
        
        if config.autorefresh {
            
            //Método para iniciar o temporizar
            timer = Timer.scheduledTimer(withTimeInterval: config.timeInterval, repeats: true) { (timer) in
                self.showRandomQuote()
            }
        }
        showRandomQuote()
    }
    
    func showRandomQuote() {
        
        // Pegando um quote aleatorio
        let quote = quotesManager.getRandomQuote()
        
        // Mostrando ao usuario a mensagem
        lbQuote.text  = quote.quote
        
        // Mostrando ao usuario o Autor da mensagem
        lbAuthor.text = quote.author
        
        // Mostrando ao usuario a Imagem
        ivPhoto.image = UIImage(named: quote.image)
        
        // Mostrando a foto de funco
        ivPhotoBg.image = ivPhoto.image
        
        // Ajustando o Alfa
        lbQuote.alpha = 0.0
        lbAuthor.alpha = 0.0
        ivPhoto.alpha = 0.0
        ivPhotoBg.alpha = 0.0
        lcTop.constant = 50
        view.layoutIfNeeded()
        
        //Aparecer de maneira animada
        UIView.animate(withDuration: 2.5) {
            self.lbQuote.alpha = 1
            self.lbAuthor.alpha = 1
            self.ivPhoto.alpha = 1
            self.ivPhotoBg.alpha = 0.25
            self.lcTop.constant = 10
            self.view.layoutIfNeeded()
        }
    }
}
















