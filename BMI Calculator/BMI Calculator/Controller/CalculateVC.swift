//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Berkat Bhatti on 3/17/21.
//

import UIKit

class CalculateVC: UIViewController {

    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var buttonContainer: UIView!
    
    var bmi = 0.0
    
    var service = BMIService()

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        // Format to a String to get 1 decimal place
        // AS well as get the data type to pass to the label
        let heightValue = String(format: "%.1f", sender.value)
        heightLabel.text = "\(heightValue)m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weightValue = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weightValue)Kg"
    }
    
    
    @IBAction func calculatePressed(_ sender: Any) {
        let height = heightSlider.value
        let weight = weightSlider.value
        // BMI Formula - (weight in KG / height in m^2) 
        service.calculateBMI(height: height, weight: weight)
        performSegue(withIdentifier: "calculateToResult", sender: self)
    }
    
    // Prepare for segue to pass the BMi result to the result Page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Safety check to make sure identifier is correct
        if segue.identifier == "calculateToResult" {
            // We can force cast the vc since we know for sure it will exist
            let resultVC = segue.destination as! ResultsVC
            resultVC.result = String(format: "%.1f", service.bmi)
            resultVC.suggestion = service.suggeston
        }
    }
    
    
}

