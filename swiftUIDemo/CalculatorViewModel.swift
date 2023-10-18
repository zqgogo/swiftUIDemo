//
//  CalculatorModel.swift
//  swiftUIDemo
//
//  Created by qilitech.ltd on 2023/10/17.
//

import SwiftUI
import Foundation
import Combine

class CalculatorViewModel: ObservableObject {
    @Published var brain = CalculatorBrain.left("0")
    @Published var history: [CalculatorButtonItem] = []
    
    func apply(_ item: CalculatorButtonItem) {
        brain = brain.apply(item: item)
        history.append(item)
        temporaryKept.removeAll()
        slidingIndex = Float(totalCount)
    }
    
    // 1
    var historyDetail: String {
        history.map { $0.title }.joined()
    }
    // 2
    var temporaryKept: [CalculatorButtonItem] = []
    // 3
    var totalCount: Int {
        history.count + temporaryKept.count
    }
    // 4
    var slidingIndex: Float = 0 {
        didSet {
            // 5
            // 维护 `history` 和 `temporaryKept`
            keepHistory(upTo: Int(slidingIndex))
        }
    }
    
    func keepHistory(upTo index: Int) {
        precondition(index <= totalCount, "Out of index.")
        let total = history + temporaryKept
        history = Array(total[..<index])
        temporaryKept = Array(total[index...])
        brain = history.reduce(CalculatorBrain.left("0")) {
            result, item in
            result.apply(item: item)
        }
    }
}
