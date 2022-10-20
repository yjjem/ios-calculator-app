//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 유제민 on 2022/09/30.
//

import UIKit

enum ExpresionParser {
    static func parse(from input: String) -> Formula {
        let componenets = componentsByOperators(from: input)
        var formula = Formula()
        let operatorCases = Operator.allCases.map { String($0.rawValue) }
        
        let operators = componenets.filter { operatorCases.contains($0) }
                                .compactMap { Operator(rawValue: Character($0)) }
        operators.forEach { formula.operators.enqueue(data: $0) }
        
        let operands = componenets.filter { !operatorCases.contains($0) }
                                .compactMap { Double($0) }
        operands.forEach { formula.operands.enqueue(data: $0) }
        
        return formula
    }
        
    private static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: "/")
    }
}
