//
//  ContentView.swift
//  swiftUIDemo
//
//  Created by qilitech.ltd on 2023/10/12.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: CalculatorViewModel
    
    @State private var editingHistory = false
    @State private var showingResult = false
    
    var body: some View {
        VStack(spacing: 12) {
            HistroyView(editingHistory: $editingHistory)
            
//            Button("操作履历: \(viewModel.history.count)") {
//                self.editingHistory = true
//            }.sheet(isPresented: $editingHistory) {
//                HistroyView(editingHistory: $editingHistory)
//            }
            
            Spacer()
            
            Text(viewModel.brain.output)
                .foregroundColor(.black)
                .font(.system(size: 76))
                .minimumScaleFactor(0.5)
                .padding(.trailing, 24)
                .lineLimit(1)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                .alert(viewModel.brain.output, isPresented: $showingResult) {
                    Button("okk") {
                        
                    }
                }.onTapGesture {
                    self.showingResult.toggle()
                }
            
            Button("Test") {    // 2
                self.viewModel.brain = .left("1.23")
                self.viewModel.brain = .left("2.23")
            }
            .font(.largeTitle)
            
            CalculatorButtonPad()
                .padding(.bottom)
        }
        .onChange(of: viewModel.brain) { newValue in
            print(newValue.output)
        }
        .scaleEffect(Self.scale)
    }
}

extension ContentView {
    static let scale = UIScreen.main.bounds.width / 414
}

struct CalculatorButtonPad: View {
    let pad: [[CalculatorButtonItem]] = [
        [.command(.clear), .command(.flip),
         .command(.percent), .op(.divide)],
        [.digit(7), .digit(8), .digit(9), .op(.multiply)],
        [.digit(4), .digit(5), .digit(6), .op(.minus)],
        [.digit(1), .digit(2), .digit(3), .op(.plus)],
        [.digit(0), .dot, .op(.equal)]
    ]
    
    var body: some View {
        VStack(spacing: 8) {
            ForEach(pad, id: \.self) { row in
                CalculatorButtonRow(row: row)
            }
        }
    }
}

struct CalculatorButtonRow : View {
    @EnvironmentObject var viewModel: CalculatorViewModel
    let row: [CalculatorButtonItem]
    
    var body: some View {
        HStack {
            ForEach(row, id: \.self) { item in
                CalculatorButton(
                    title: item.title,
                    size: item.size,
                    backgroundColorName: item.backgroundColorName)
                {
                    print("Button: \(item.title)")
                    self.viewModel.apply(item)
                }
            }
        }
    }
}

struct CalculatorButton: View {
    let fontSize: CGFloat = 38
    let title: String
    let size: CGSize
    let backgroundColorName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(.white)
                .font(.system(size: fontSize))
                .frame(width: size.width, height: size.height)
                .background(Color(backgroundColorName))
                .cornerRadius(size.width / 2)
        }
    }
}








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(CalculatorViewModel())
//            .environment(\.colorScheme, .dark)
//        ContentView().previewDevice("iPhone SE (3rd generation)")
//        ContentView().previewDevice("iPad Air (5th generation)")
    }
}
