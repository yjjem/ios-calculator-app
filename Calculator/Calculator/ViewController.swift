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
    
    @IBOutlet weak var InputScrollView: UIScrollView!
    @IBOutlet weak var EntryStackView: UIStackView!
    var userRawInput: String = ""
    var userEntry: String = ""
    
    var formatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userRawInput = ""
        userEntry = "0"
        InputScrollView.showsVerticalScrollIndicator = false
        configureFormatter()
        EntryStackView.spacing = 8
    }
    
    func configureFormatter() {
        formatter.maximumIntegerDigits = 20
        formatter.maximumFractionDigits = 20
        formatter.numberStyle = .decimal
    }
    
    func collectUserIput() {
        guard let signValue = displaySignLabel.text else { return }
        guard userEntry != "0" else { return }
        userRawInput += "/" + signValue + "/" + userEntry
        tapClearEntry()
        CFGetRetainCount(Node(value: 10))
        CFGetRetainCount(Node(value: "Hello"))
    }
    
    func addOperator(by sender: UIButton) {
        guard displayEntryLabel.text != "0" else { return }
        addSubviewToStack(operatorData: displaySignLabel.text, operandData: userEntry)
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
    
    func setEntryLabel(with input: String) {
        guard let number = formatter.number(from: input) else { return }
        let formattedNumber = formatter.string(from: number)
        displayEntryLabel.text = formattedNumber
    }
    
    func addToEntry(element: MathElements) {
        
        switch element {
        case .zero, .doubleZero:
            guard displayEntryLabel.text != "0" else { return }
            userEntry += element.rawValue
            print("Entry:", userEntry)
            setEntryLabel(with: userEntry)
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
            guard displayEntryLabel.text == "0", displayEntryLabel.text?.count == 20 else {
                userEntry += element.rawValue
                print("Entry:", userEntry)
                setEntryLabel(with: userEntry)
                return }
        case .dot:
            guard displayEntryLabel.text?.contains(element.rawValue) != true else { return }
            userEntry  += element.rawValue
            print("Entry:", userEntry)
            setEntryLabel(with: userEntry)
        }
    }
    
    func addSubviewToStack(operatorData: String?, operandData: String) {
        let operatorLabel: UILabel = makeLabel(from: operatorData ?? "")
        let operandLabel: UILabel  = makeLabel(from: operandData)
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(operandLabel)

        EntryStackView.addArrangedSubview(stackView)
        moveToBottom()
        print(EntryStackView.arrangedSubviews.count)
    }
    
    func moveToBottom() {
        InputScrollView.layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: InputScrollView.contentSize.height - InputScrollView.bounds.height)
        InputScrollView.setContentOffset(bottomOffset, animated: true)
    }
    
    func makeLabel(from data: String) -> UILabel {
        let label = UILabel()
        label.text = data
        label.textColor = .white
        
        return label
    }
    
    @IBAction func tapChangeNumberSign(_ sender: UIButton) {
        if userEntry.contains(Operator.subtract.rawValue) {
            userEntry.removeFirst()
            displayEntryLabel.text = userEntry
        } else {
            userEntry.insert(Operator.subtract.rawValue, at: userEntry.startIndex)
            displayEntryLabel.text = userEntry
        }
    }
    
    @IBAction func tapClearEntry() {
        displayEntryLabel.text = "0"
        userEntry = ""
    }
    
    @IBAction func tapClearAll() {
        for view in EntryStackView.arrangedSubviews {
            view.removeFromSuperview()
//            EntryStackView.removeArrangedSubview(view)
        }
        displayEntryLabel.text = "0"
        userEntry = ""
        userRawInput = ""
        print("ClearAll")
    }
    
    @IBAction func tapAddDoubleZeroToEntry(_ sender: UIButton) {
        addToEntry(element: .doubleZero)
    }
    
    @IBAction func tapAddZeroToEntry(_ sender: UIButton) {
        addToEntry(element: .zero)
    }
    
    @IBAction func tapAddOneToEntry(_ sender: UIButton) {
        addToEntry(element: .one)
    }
    
    @IBAction func tapAddTwoToEntry(_ sender: UIButton) {
        addToEntry(element: .two)
    }
    
    @IBAction func tapAddThreeToEntry(_ sender: UIButton) {
        addToEntry(element: .three)
    }
    
    @IBAction func tapAddFourToEntry(_ sender: UIButton) {
        addToEntry(element: .four)
    }
    
    @IBAction func tapAddFiveToEntry(_ sender: UIButton) {
        addToEntry(element: .five)
    }
    
    @IBAction func tapAddSixToEntry(_ sender: UIButton) {
        addToEntry(element: .six)
    }
    
    @IBAction func tapAddSevenToEntry(_ sender: UIButton) {
        addToEntry(element: .seven)
    }
    
    @IBAction func tapAddEightToEntry(_ sender: UIButton) {
        addToEntry(element: .eight)
    }
    
    @IBAction func tapAddNineToEntry(_ sender: UIButton) {
        addToEntry(element: .nine)
    }
    
    @IBAction func tapAddDotToEntry(_ sender: UIButton) {
        addToEntry(element: .dot)
    }
    
    @IBAction func tapDivisionButton(_ sender: UIButton) {
        addOperator(by: sender)
//        addSubviewToStack(operatorData: displaySignLabel.text, operandData: userEntry)
    }
    
    @IBAction func tapMultiplyButton(_ sender: UIButton) {
        addOperator(by: sender)
//        addSubviewToStack(operatorData: displaySignLabel.text, operandData: userEntry)
    }
    
    @IBAction func tapSubstractButton(_ sender: UIButton) {
        addOperator(by: sender)
//        addSubviewToStack(operatorData: displaySignLabel.text, operandData: userEntry)
    }
    
    @IBAction func tapAddButton(_ sender: UIButton) {
        addOperator(by: sender)
    }
    
    @IBAction func tapCalculateButton(_ sender: UIButton) {
        guard userRawInput.isEmpty != true else { return }
        collectUserIput()
        //delete later
        print(userRawInput)
        var formula = ExpresionParser.parse(from: userRawInput)
        let result = formula.result()
        //delete later
        print(result)
        guard let result = result else { return }
        tapClearAll()
        displayEntryLabel.text =  formatter.string(from: NSNumber(value: result))
    }
}

