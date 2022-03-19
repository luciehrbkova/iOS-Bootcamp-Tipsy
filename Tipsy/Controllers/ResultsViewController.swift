//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Lucie Hrbkova on 15/01/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalPerPerson: String?
    var recommedation: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = totalPerPerson
        settingsLabel.text = recommedation
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
