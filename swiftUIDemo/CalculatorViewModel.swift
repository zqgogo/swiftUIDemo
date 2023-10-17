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
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    var brain = CalculatorBrain.left("0") {
        willSet {
            objectWillChange.send()
        }
    }
    
}
