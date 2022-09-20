//
//  CalculatorTesting.swift
//  CalculatorTesting
//
//  Created by 유제민 on 2022/09/20.
//

import XCTest
@testable import Calculator
class CalculatorTesting: XCTestCase {
    var sut: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_queueu_첫번쨰_add_아이템_key_0인지_확인() {
        
        //given
        let myItem = Item(number: 10)
        sut.add(item: myItem)
        
        //when
        let expected = Optional([0 : Item(number: 10)])
        
        //then
        XCTAssertEqual(expected, sut.queue["queue"])
    }
}
