//
//  Matrix.swift
//  TicTacToe
//
//  Created by Alejandro Galue on 11/8/15.
//  Copyright © 2015 Street Dog Studio. All rights reserved.
//

public struct Matrix {
    let rows: Int, columns: Int

    var grid: [Int]

    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0)
    }
    
    func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    func indexIsValid(idx : Int) -> Bool {
        return idx >= 0 && idx <= rows * columns
    }
    
    subscript(row: Int, column: Int) -> Int {
        get {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
    
    subscript(index : Int) -> Int {
        get {
            assert(indexIsValid(index), "Index out of range")
            return grid[index]
        }
        set {
            assert(indexIsValid(index), "Index out of range")
            grid[index] = newValue
        }
    }
}