//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipValue = 0.1
    var numberOfPeople = 2
    var billTotal = 0.0
    var billPerPerson = ""
    

    @IBAction func tipChanged(_ sender: UIButton) {
        
        //Dismiss the keyboard when the user chooses one of the tip values.
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let tipChoice = sender.currentTitle!
        let buttonTitleMinusPercentage = tipChoice.dropLast()
        let buttonTitleAsNumber = Double(buttonTitleMinusPercentage)!
        tipValue = buttonTitleAsNumber / 100
        
    }
    
    @IBAction func stepperValueChenged(_ sender: UIStepper) {
        numberOfPeople = Int(sender.value)
        splitNumberLabel.text = String(numberOfPeople)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(tipValue)
        print(numberOfPeople)
        
        //Get the text the user typed in the billTextField
        let bill = billTextField.text!
        if bill != "" {
            billTotal = Double(bill)!
        }
        
        let result = billTotal * (1 + tipValue) / Double(numberOfPeople)
        let resultFormated = String(format: "%.2f", result)
        print(resultFormated)
        billPerPerson = resultFormated
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalPerPerson = billPerPerson
            destinationVC.recommedation = "Split between \(numberOfPeople), with \(tipValue * 100)% tip."
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
    }
}

