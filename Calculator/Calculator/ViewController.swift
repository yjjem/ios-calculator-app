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
    
    var userRawInput: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userRawInput = ""
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
    
    func collectUserIput() {
        guard let signValue = displaySignLabel.text,
                let entryValue = displayEntryLabel.text else { return }
        guard entryValue != "0" else { return }
        userRawInput += "/" + signValue + "/" + entryValue
        ClearEntry()
    }
    
    func ClearEntry() {
        displaySignLabel.text = ""
        displayEntryLabel.text = "0"
    }
    
    func ClearAll() {
        userRawInput = ""
        ClearEntry()
    }
    
    @IBAction func tapAddDoubleZeroToEntry(_ sender: UIButton) {
        addToEntry(element: "00")
    }
    
    @IBAction func tapAddZeroToEntry(_ sender: UIButton) {
        addToEntry(element: "0")
    }
    
    @IBAction func tapAddOneToEntry(_ sender: UIButton) {
        addToEntry(element: "1")
    }
    
    @IBAction func tapAddTwoToEntry(_ sender: UIButton) {
        addToEntry(element: "2")
    }
    
    @IBAction func tapAddThreeToEntry(_ sender: UIButton) {
        addToEntry(element: "3")
    }
    
    @IBAction func tapAddFourToEntry(_ sender: UIButton) {
        addToEntry(element: "4")
    }
    
    @IBAction func tapAddFiveToEntry(_ sender: UIButton) {
        addToEntry(element: "5")
    }
    
    @IBAction func tapAddSixToEntry(_ sender: UIButton) {
        addToEntry(element: "6")
    }
    
    @IBAction func tapAddSevenToEntry(_ sender: UIButton) {
        addToEntry(element: "7")
    }
    
    @IBAction func tapAddEightToEntry(_ sender: UIButton) {
        addToEntry(element: "8")
    }
    
    @IBAction func tapAddNineToEntry(_ sender: UIButton) {
        addToEntry(element: "9")
    }
    
    @IBAction func tapAddDotToEntry(_ sender: UIButton) {
        addToEntry(element: ".")
    }
    
    @IBAction func tapDivisionButton(_ sender: UIButton) {
        collectUserIput()
        displaySignLabel.text = String(Operator.divide.rawValue)
    }
    
    @IBAction func tapMultiplyButton(_ sender: UIButton) {
        collectUserIput()
        displaySignLabel.text = String(Operator.multiply.rawValue)
    }
    
    @IBAction func tapSubstractButton(_ sender: UIButton) {
        collectUserIput()
        displaySignLabel.text = String(Operator.subtract.rawValue)
    }
    
    @IBAction func tapAddButton(_ sender: UIButton) {
        collectUserIput()
        displaySignLabel.text = String(Operator.add.rawValue)
    }
    
    @IBAction func tapCalculateButton(_ sender: UIButton) {
        collectUserIput()
        print(userRawInput)
        var formula = ExpresionParser.parse(from: userRawInput)
        let result = formula.result()
        print(result)
        guard let result = result else { return }
        ClearAll()
        displayEntryLabel.text? = String(result)
    }
}

