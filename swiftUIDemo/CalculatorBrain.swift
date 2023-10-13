//
//  CalculatorBrain.swift
//  swiftUIDemo
//
//  Created by qilitech.ltd on 2023/10/13.
//

import Foundation

enum CalculatorBrain {
    case left(String)   // 1
    case leftOp(
        left: String,
        op: CalculatorButtonItem.Op
    )             // 2
    case leftOpRight(
        left: String,
        op: CalculatorButtonItem.Op,
        right: String
    )             // 3
    case error          // 4
}
