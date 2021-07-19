//
//  ContentView.swift
//  RomanNumerals
//
//  Created by Kevin Desai on 7/19/21.
//

import SwiftUI

struct ContentView: View {
    @State private var numberInput: String = "0"
    @ObservedObject var romanNumeralModel = RomanNumeralModel()
    var body: some View {
        VStack{
            TextField("Enter number to transform", text: $numberInput, onEditingChanged: { (_) in }) {
                if !self.numberInput.isEmpty {
                    self.romanNumeralModel.convert(int: self.numberInput)
                }
            }
            Divider()
            Text(romanNumeralModel.convertedRomanNumeral).font(.body)
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
