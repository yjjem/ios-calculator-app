//
//  CalculatorTesting.swift
//  CalculatorTesting
//
//  Created by 유제민 on 2022/09/20.
//

import XCTest
@testable import Calculator
class CalculatorTesting: XCTestCase {
    
    var sut: CalculatorItemQueue<Double>!
    let rhs: Double = 1.0
    let lhs: Double = 1.0
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    func test_queue_append_firstElement_isSucessfull() {
        sut.enqueue(data: 10)
        let result = sut.dequeue()
        XCTAssertEqual(result, 10)
    }
    
    func test_queue_after_appending_secondElement_FirstNode_next_equal_to_nextNode() {
        sut.enqueue(data: 20)
        sut.enqueue(data: 30)
        sut.enqueue(data: 40)
        
        XCTAssertEqual(sut.read()?.next?.value, 30)
    }
    
    func test_queue_getFirst_returns_head_sucessfully() {
    
    
        sut.enqueue(data: 20)
        sut.enqueue(data: 30)
        sut.enqueue(data: 40)
    
        XCTAssertEqual(sut.dequeue(), 20)
    }
    
    func test_queue_after_removeAll_head_returns_nil() {
        sut.enqueue(data: 20)
        sut.enqueue(data: 30)
        sut.enqueue(data: 40)
        
        sut.removeAll()
        
        XCTAssertNil(sut.read())
    }
    
    func test_String_split_works_nice() {
        let myInput = "1.1/+/1.2/-/123.41"
        
        XCTAssertEqual(myInput.split(separator: "/"),["1.1","+","1.2","-","123.41"])
    }
    
    func test_Operator_function_add_works() {
        let myCase  = Operator(rawValue: "+")
        let result = myCase?.calculate(lhs: lhs, rhs: rhs)
        
        XCTAssertEqual(result, 2.0)
    }
    
    func test_Operator_function_divide_works() {
        let result = Operator.divide.calculate(lhs: lhs, rhs: rhs)
        
        XCTAssertEqual(result, 1.0)
    }
    
    func test_enqueue101_deque_until_nil_count_100() {
        var dequeueResult: [Double] = []
        
        for i in 0...100 {
            sut.enqueue(data: Double(i))
        }
        
        while sut.read()?.next != nil {
            guard let deq = sut.dequeue() else { return }
            dequeueResult.append(deq as Double)
        }
        
        XCTAssertEqual(dequeueResult.count, 100)
    }
    
    func test_zero_division_error_thrown_when_lhs_is_zero() {
        XCTAssertThrowsError(Operator.divide.calculate(lhs: 0, rhs: 12.3))
    }
}
