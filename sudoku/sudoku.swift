//
//  sudoku.swift
//  sudoku
//
//  Created by Giovanni Grano on 28.12.17.
//  Copyright © 2017 Giovanni Grano. All rights reserved.
//

import Foundation

class Sudoku {
    
    let _digits   : String   = "123456789"
    let _rows     : String   = "ABCDEFGHI"
    let _cols     : String
    var _squares  : [String] = []
    var _unitlist : [[String]] = []
    var _units    = [String: [[String]]]()
    var _peers    = [String: Set<String>]()
    
    init() {
        _cols     = _digits
        _squares  = cross(a: _rows, b: _digits)
        _unitlist = _cols.flatMap { return cross(a: _rows, b: String($0))} +
                    _rows.flatMap { return cross(a: String($0), b: _cols)} +
                    ["ABC", "DEF", "GHI"].flatMap { rs in
                        ["123", "456", "789"].map { cs in
                            return cross(a: rs, b: cs)}}
        _units = _squares.reduce(into: [:]) { result, key in
            result[key] = _unitlist.filter { $0.contains(key)}
        }
        _peers = _squares.reduce(into: [:]) { result, key in
            result[key] = _unitlist.filter { $0.contains(key) }.flatMap{$0}
                .reduce(Set()) { $0.union(CollectionOfOne($1)) }.filter{!$0.elementsEqual(key)}
        }
    }
    
    func cross(a: String, b: String) -> [String] {
        return a.flatMap { r in
            b.flatMap { d in
                return ["\(r)" + "\(d)"]
            }
        }
    }
}


