//
//  ViewController.swift
//  Calculator
//
//  Created by Lu wenbo on 17/06/2017.
//  Copyright © 2017 lu wenbo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingANumber: Bool = false
    
    @IBAction func appendDigit(_ sender: UIButton){
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + digit
        }else{
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
        print("digit = \(digit)")
    }
    var operandStack = Array<Double>()
    

    
    var displayValue : Double{
        get {
            return (display.text! as NSString).doubleValue
        }
        set{
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
    @IBAction func operate(_ sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber{
            enter()
        }
        switch operation{
            //case "x":performOperation((op1, op2) in {return op1 * op2})
            case "x":performOperation { $0 * $1}
            //case "/":performOperation { $0 / $1}
            case "+":performOperation { $0 + $1}
            case "-":performOperation { $0 - $1}
            case "√":performOperation1 { sqrt($0) }
            default:break
        }
    }
    
    func performOperation(operation: (Double, Double) -> Double){
        if operandStack.count >= 2{
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    func performOperation1(operation: (Double) -> Double){
        if operandStack.count >= 1{
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
    }
}

