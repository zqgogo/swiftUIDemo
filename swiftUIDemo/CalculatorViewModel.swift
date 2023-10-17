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
    }
}
