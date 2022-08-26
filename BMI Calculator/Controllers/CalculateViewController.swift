//
//  ViewController.swift
//  BMI Calculator
//
//  Created by YILDIRIM on 26.08.2022.
//  Copyright © 2022 YILDIRIM. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func heigthSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height) cm"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight =  String(format: "%.0f", sender.value)
        weightLabel.text =  "\(weight) kg"
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let height = heightSlider.value     //Height, weight values from slider
        let weight = weightSlider.value
        
        
        calculatorBrain.calculateBMI(height: height, weight: weight) //BMI Calcutaing Func from model
      
        //Go to SecondViewController
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.bmiValue = calculatorBrain.getBMIValue() //BMI Value coming from model
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}

