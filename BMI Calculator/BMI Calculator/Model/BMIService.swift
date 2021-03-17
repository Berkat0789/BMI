//
//  BMIService.swift
//  BMI Calculator
//
//  Created by Berkat Bhatti on 3/17/21.
//

import Foundation
import UIKit

// This service object will be used to optimize the code, use funciton to handle calculation instead of a btue approach
// Will also use the BMI created Structure to hold the values we need to pass


struct BMIService {
    
    var bmi: BMI?
    
    // Calculate the BMI
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue  = weight / pow(height, 2)
        bmi = BMI(value: bmiValue, color: checkBMI(value: bmiValue).color, suggestion: checkBMI(value: bmiValue).suggestion)
    }
    // Lets create a function that will check the value of the bmi and make a suggestion to user if over a certain value
    mutating func checkBMI(value: Float) -> BMI {
        switch value {
        case 0..<18:
            return BMI(value: value, color: UIColor.orange, suggestion: "Eat a litte more")
        case 18..<24:
            return BMI(value: value, color: UIColor.green, suggestion: "Doing ok i guess")
        case 24...:
           return BMI(value: value, color: UIColor.red, suggestion: "Time to hit the gym bro")
        default:
            return BMI(value: 0.0, color: UIColor.yellow, suggestion: "BMI was not registered")
        }
    }
    // To not deal with optional in the controller lets use a computed property get the value and suggestion
    var BMIStringValue: String {
        return String(format: "%.1f", bmi?.value ?? "0.0")
    }
    var SuggestionText: String {
        return bmi?.suggestion ?? "BMI not recognized"
    }
}
