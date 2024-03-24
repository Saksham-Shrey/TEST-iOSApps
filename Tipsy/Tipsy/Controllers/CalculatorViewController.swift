//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip: Double?
    var billTotal: Double?
    var splitBetween: Int?
    var total: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billTextField.delegate = self
        billTextField.keyboardType = .decimalPad
        tenPctButton.isSelected = true
        tip = 0.1
        splitBetween = 1
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        if sender.titleLabel?.text == "0%" {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tip = 0.0
        } else if sender.titleLabel?.text == "10%" {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            tip = 0.1
        } else {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            tip = 0.2
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        splitBetween = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        billTotal = Double(billTextField.text ?? "0.0") ?? 0.0
        
        total = ((billTotal! + (tip! * billTotal!)) / Double(splitBetween!))
        
        performSegue(withIdentifier: "goToResults", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            if let destinationVC = segue.destination as? ResultsViewController {
                
                destinationVC.resultTotal = total
                destinationVC.resultTip = Int(tip! * 100)
                destinationVC.resultSplitBetween = splitBetween
            }
        }
    }
    
}

