//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displaySignLabel: UILabel!
    @IBOutlet weak var displayEntryLabel: UILabel!
    
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var doubleZeroButton: UIButton!
    @IBOutlet weak var dotButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    
    @IBOutlet weak var clearAllButton: UIButton!
    @IBOutlet weak var clearEntryButton: UIButton!
    @IBOutlet weak var changeSignButton: UIButton!
    
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var substractButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var calculateButton: UIButton!
    
    @IBOutlet weak var EntryStackView: UIStackView!
    var userRawInput: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userRawInput = ""
    }
    
    func collectUserIput() {
        guard let signValue = displaySignLabel.text,
                let entryValue = displayEntryLabel.text else { return }
        guard entryValue != "0" else { return }
        userRawInput += "/" + signValue + "/" + entryValue
        clearEntry()
    }
    
    func changeSign(by sender: UIButton) {
        guard displayEntryLabel.text != "0" else { return }
        collectUserIput()
        
        switch sender {
        case divideButton:
            displaySignLabel.text = String(Operator.divide.rawValue)
        case multiplyButton:
            displaySignLabel.text = String(Operator.multiply.rawValue)
        case substractButton:
            displaySignLabel.text = String(Operator.subtract.rawValue)
        case addButton:
            displaySignLabel.text = String(Operator.add.rawValue)
        default:
            print("Error while changing sign")
        }
    }
    
    func addToEntry(element: String) {
        switch element {
        case "0","00":
            guard displayEntryLabel.text != "0" else { return }
            displayEntryLabel.text? += element
        case "1","2","3","4","5","6","7","8","9":
            guard displayEntryLabel.text != "0" else {
                displayEntryLabel.text? = element
                return
            }
            displayEntryLabel.text? += element
        case ".":
            guard displayEntryLabel.text?.contains(".") != true else { return }
            displayEntryLabel.text? += element
        default:
            displayEntryLabel.text? = "Error"
        }
    }
    
    func clearEntry() {
        displaySignLabel.text = ""
        displayEntryLabel.text = "0"
    }
    
    func clearAll() {
        userRawInput = ""
        clearEntry()
    }
    
    @IBAction func tapClearEntry(_ sender: Any) {
        clearEntry()
    }
    
    @IBAction func tapClearAll(_ sender: Any) {
        clearAll()
    }
    
    @IBAction func tapAddDoubleZeroToEntry(_ sender: UIButton) {
        addToEntry(element: MathElements.doubleZero.rawValue)
    }
    
    @IBAction func tapAddZeroToEntry(_ sender: UIButton) {
        addToEntry(element: MathElements.zero.rawValue)
    }
    
    @IBAction func tapAddOneToEntry(_ sender: UIButton) {
        addToEntry(element: MathElements.one.rawValue)
    }
    
    @IBAction func tapAddTwoToEntry(_ sender: UIButton) {
        addToEntry(element: MathElements.two.rawValue)
    }
    
    @IBAction func tapAddThreeToEntry(_ sender: UIButton) {
        addToEntry(element: MathElements.three.rawValue)
    }
    
    @IBAction func tapAddFourToEntry(_ sender: UIButton) {
        addToEntry(element: MathElements.four.rawValue)
    }
    
    @IBAction func tapAddFiveToEntry(_ sender: UIButton) {
        addToEntry(element: MathElements.five.rawValue)
    }
    
    @IBAction func tapAddSixToEntry(_ sender: UIButton) {
        addToEntry(element: MathElements.six.rawValue)
    }
    
    @IBAction func tapAddSevenToEntry(_ sender: UIButton) {
        addToEntry(element: MathElements.seven.rawValue)
    }
    
    @IBAction func tapAddEightToEntry(_ sender: UIButton) {
        addToEntry(element: MathElements.eight.rawValue)
    }
    
    @IBAction func tapAddNineToEntry(_ sender: UIButton) {
        addToEntry(element: MathElements.nine.rawValue)
    }
    
    @IBAction func tapAddDotToEntry(_ sender: UIButton) {
        addToEntry(element: MathElements.dot.rawValue)
    }
    
    @IBAction func tapDivisionButton(_ sender: UIButton) {
        changeSign(by: sender)
    }
    
    @IBAction func tapMultiplyButton(_ sender: UIButton) {
        changeSign(by: sender)
    }
    
    @IBAction func tapSubstractButton(_ sender: UIButton) {
        changeSign(by: sender)
    }
    
    @IBAction func tapAddButton(_ sender: UIButton) {
        changeSign(by: sender)
    }
    
    @IBAction func tapCalculateButton(_ sender: UIButton) {
        collectUserIput()
        //delete later
        print(userRawInput)
        var formula = ExpresionParser.parse(from: userRawInput)
        let result = formula.result()
        //delete later
        print(result)
        guard let result = result else { return }
        clearAll()
        displayEntryLabel.text? = String(result)
    }
}

