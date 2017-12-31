//
//  SudokuTest.swift
//  SudokuTest
//
//  Created by Giovanni Grano on 31.12.17.
//  Copyright © 2017 Giovanni Grano. All rights reserved.
//

import XCTest
@testable import sudoku

class SudokuTest: XCTestCase {

    let sudoku : Sudoku = Sudoku()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSizes() {
        assert(sudoku._squares.count == 81)
        assert(sudoku._unitlist.count == 27)
        sudoku._squares.forEach{ assert(sudoku._units[$0]?.count == 3) }
        sudoku._squares.forEach{ assert(sudoku._peers[$0]?.count == 20) }
    }
    
    func testUnits() {
        let expected: [[String]] = [["A2", "B2", "C2", "D2", "E2", "F2", "G2", "H2", "I2"],
                                    ["C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8", "C9"],
                                    ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]]
        assert((sudoku._units["C2"]?.elementsEqual(expected, by: ==))!)
    }
    
    func testPeers() {
        let expected: Set<String> = ["A2", "B2", "D2", "E2", "F2", "G2", "H2", "I2",
                                     "C1", "C3", "C4", "C5", "C6", "C7", "C8", "C9",
                                     "A1", "A3", "B1", "B3"]
        assert(sudoku._peers["C2"] == expected)
    }
}
