//
//  ResultsVC.swift
//  BMI Calculator
//
//  Created by Berkat Bhatti on 3/17/21.
//

import Foundation
import UIKit



class ResultsVC: UIViewController {
    
    @IBOutlet weak var resultvalue: UILabel!
    @IBOutlet weak var resultContainer: UIView!
    @IBOutlet weak var suggestionText: UILabel!
    
    var result: String?
    var suggestion: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // This will round the container for the result
        // We wil lchange the background of the container depending on the value ofthe BMI also 
        resultContainer.layer.cornerRadius = resultContainer.frame.height / 2
        resultvalue.text = result
        suggestionText.text = suggestion
    }
    
    @IBAction func reCalculatePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
