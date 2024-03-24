//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Saksham Shrey on 23/03/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var resultTotal: Double?
    var resultSplitBetween: Int?
    var resultTip: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = String(format: "%.2f", resultTotal!)
        settingsLabel.text = "Split between \(resultSplitBetween!) people, with \(resultTip!)% tip." 
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
