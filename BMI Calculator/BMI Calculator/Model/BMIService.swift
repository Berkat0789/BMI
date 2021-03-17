//
//  BMIService.swift
//  BMI Calculator
//
//  Created by Berkat Bhatti on 3/17/21.
//

import Foundation


// This service object will be used to optimize the code, use funciton to handle calculation instead of a btue approach
// Will also use the BMI created Structure to hold the values we need to pass


struct BMIService {
    var bmi: Float = 0.0
    var suggeston = ""
    
    // Calculate the BMI
    mutating func calculateBMI(height: Float, weight: Float) {
        bmi = weight / pow(height, 2)
        checkBMI(value: bmi)
    }
    // Lets create a function that will check the value of the bmi and make a suggestion to user if over a certain value
    mutating func checkBMI(value: Float) {
        switch value {
        case 0..<18:
            suggeston = "Eat a litte more"
        case 18..<24:
            suggeston = "Doing ok i guess"
        case 24...:
            suggeston = "Hit the gym sometime soon"
        default:
             suggeston = "BMI Error"
        }
    }
}
