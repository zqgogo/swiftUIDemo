//
//  HistroyView.swift
//  swiftUIDemo
//
//  Created by qilitech.ltd on 2023/10/18.
//

import SwiftUI

struct HistroyView: View {
    @EnvironmentObject var viewModel: CalculatorViewModel
    @Binding var editingHistory: Bool

    var body: some View {
        VStack {
            Button("返回") {
                self.editingHistory = false
            }.padding()
            Spacer(minLength: 50)
            // 1
            if viewModel.totalCount == 0 {
                Text("没有履历")
            } else {
                HStack {
                    Text("履历").font(.headline)
                    Text("\(viewModel.historyDetail)").lineLimit(nil)
                }
                HStack {
                    Text("显示").font(.headline)
                    Text("\(viewModel.brain.output)")
                }
                // 2
                Slider(
                    value: $viewModel.slidingIndex,
                    in: 0...Float(viewModel.totalCount),
                    step: 1
                )
            }
            Spacer()
        }.padding()
    }
}










struct HistroyView_Previews: PreviewProvider {
    static var previews: some View {
        HistroyView(editingHistory: Binding.constant(false)).environmentObject(CalculatorViewModel())
    }
}
