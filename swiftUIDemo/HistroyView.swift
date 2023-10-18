//
//  HistroyView.swift
//  swiftUIDemo
//
//  Created by qilitech.ltd on 2023/10/18.
//

import SwiftUI

struct HistroyView: View {
    @ObservedObject var model: CalculatorViewModel
    
    var body: some View {
        VStack {
            // 1
            if model.totalCount == 0 {
                Text("没有履历")
            } else {
                HStack {
                    Text("履历").font(.headline)
                    Text("\(model.historyDetail)").lineLimit(nil)
                }
                HStack {
                    Text("显示").font(.headline)
                    Text("\(model.brain.output)")
                }
                // 2
                Slider(
                    value: $model.slidingIndex,
                    in: 0...Float(model.totalCount),
                    step: 1
                )
            }
        }.padding()
    }
}










struct HistroyView_Previews: PreviewProvider {
    static var previews: some View {
        HistroyView(model: CalculatorViewModel())
    }
}
