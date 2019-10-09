//
//  ViewController.swift
//  Calculator
//
//  Created by Yeldan_Mac on 9/8/19.
//  Copyright © 2019 Yeldan_Mac. All rights reserved.
//

//import UIKit
//
//class ViewController: UIViewController {
//
//    var numberOnScreen:Double = 0;
//    var previousNumber:Double = 0;
//    var performingMath = false
//    var operation = 0;
//
//    @IBOutlet weak var label: UILabel!
//
//    @IBAction func numbers(_ sender: UIButton) {
//
//        if performingMath == true {
//            label.text = String(sender.tag-1)
//            numberOnScreen = Double(label.text!)!
//            performingMath = false
//        }
//        else {
//            label.text = label.text! + String(sender.tag-1)
//            numberOnScreen = Double(label.text!)!
//        }
//
//    }
//
//    @IBAction func buttons(_ sender: UIButton) {
//
//        if label.text != "" && sender.tag != 11 && sender.tag != 16 {
//
//            previousNumber = Double(label.text!)!
//
//            if sender.tag == 12 /*Divide*/ {
//                label.text = "/";
//            }
//            else if sender.tag == 13 /*Multiply*/ {
//                label.text = "x";
//            }
//            else if sender.tag == 14 /*Minus*/ {
//                label.text = "-";
//            }
//            else if sender.tag == 15 /*Plus*/ {
//                label.text = "+";
//            }
//
//            operation = sender.tag;
//            performingMath = true;
//        }
//        else if  sender.tag == 16 {
//
//            if operation == 12 {
//                label.text = String(previousNumber / numberOnScreen)
//            }
//            else if operation == 13 {
//                label.text = String(previousNumber * numberOnScreen)
//            }
//            else if operation == 14 {
//                label.text = String(previousNumber - numberOnScreen)
//            }
//            else if operation == 15 {
//                label.text = String(previousNumber + numberOnScreen)
//            }
//        }
//        else if sender.tag == 11 {
//            label.text = "";
//            previousNumber = 0;
//            numberOnScreen = 0;
//            operation = 0;
//        }
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
//
//
//}

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay +
            digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTyping = true
        }

    }
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorData()
    
    @IBAction func performOperation(_ sender: UIButton) {
        
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        
        if let result = brain.result {
            displayValue = result
        }
        
    }
    
}
