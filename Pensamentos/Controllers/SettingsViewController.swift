//
//  SettingsViewController.swift
//  Pensamentos
//
//  Created by Eduardo Tarallo on 21/03/2018.
//  Copyright © 2018 Eduardo Tarallo. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var swAutorefresh: UISwitch!
    @IBOutlet weak var slTimerInterval: UISlider!
    @IBOutlet weak var scColorScheme: UISegmentedControl!
    @IBOutlet weak var lbTimeInterval: UILabel!
    

    let config = Configuration.shared
    
    
    // MARK: - Propriedades de View Cicle
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

    
    func formatView() {
        
        // Estado do switch
        swAutorefresh.setOn(config.autorefresh, animated: false)
        
        // Estado do slider
        slTimerInterval.setValue(Float (config.timeInterval), animated: false)
        
        // Squema de Cores
        scColorScheme.selectedSegmentIndex = config.colorScheme
        
        changeTimeIntervalLabel(with: config.timeInterval)
    }
    
    func changeTimeIntervalLabel(with value: Double) {
        lbTimeInterval.text = "Mudar após \(Int(value)) segundos"
    }
    
    
    //MARK: - Actions
    @IBAction func changeAutorefresh(_ sender: UISwitch) {
        config.autorefresh = sender.isOn
    }
    
    @IBAction func changeTimeInterval(_ sender: UISlider) {
        let value = Double(round(sender.value))
        changeTimeIntervalLabel(with: value)
        config.timeInterval = value
    }
    
    @IBAction func changeColorScheme(_ sender: UISegmentedControl) {
        config.colorScheme = sender.selectedSegmentIndex
    }
}
