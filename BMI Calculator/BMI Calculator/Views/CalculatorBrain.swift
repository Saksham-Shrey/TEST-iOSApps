//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Saksham Shrey on 23/03/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    var bmi: Float
    
    func calculateBMI(height: Float, weight: Float) -> Float {
        var bmi = Float(weight) / pow(height,2)
        return bmi
    }
}
