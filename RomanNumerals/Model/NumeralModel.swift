//
//  NumeralModel.swift
//  RomanNumerals
//
//  Created by Kevin Desai on 7/19/21.
//
import Foundation 

class RomanNumeralModel: ObservableObject {
    
    @Published var convertedRomanNumeral = ""
    
    private let romanNumeralService = RomanNumeralController()
    
    func convert(int: String) {
        romanNumeralService.convertToRomanNumeral(for: int) { returnValue, err in
            guard err == nil, let returnString = returnValue else {
                DispatchQueue.main.async {
                    self.convertedRomanNumeral = "INVALID"
                }
                return
            }
            DispatchQueue.main.async {
                self.convertedRomanNumeral = returnString
            }
        }
    }
}


