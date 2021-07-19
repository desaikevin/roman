//
//  RomanNumeralController.swift
//  RomanNumerals
//
//  Created by Kevin Desai on 7/19/21.
//

import Foundation

public protocol NumeralController {
    func convertToRomanNumeral(for Int: String, completion: (String?, ConverterError?) -> Void)
}

public enum ConverterError: Error {
    case invalidInt(String)
    case conversionError(Int)
}


class RomanNumeralController: NumeralController {
    func convertToRomanNumeral(for Int: String, completion: (String?, ConverterError?) -> Void) {
        guard let intToConvert = Int.toInt, (1...99999).contains(intToConvert) else {
            //roman numbers do not have 0 and max representation, I have included range to limit responses
            completion(nil, ConverterError.invalidInt(Int))
            return 
        }
        let result = convertIntToRoman(intToConvert)
        if result != "" {
        completion(result, nil)
        } else {
            completion(nil, ConverterError.conversionError(intToConvert))
        }
    }
    
    private func convertIntToRoman(_ int: Int) -> String {
        var mutableInt = int
        var romanValue = String()
        let romanConverterLegend =  [(1000, "M"),
                                     (900, "CM"),
                                     (500, "D"),
                                     (400, "CD"),
                                     (100, "C"),
                                     (90, "XC"),
                                     (50, "L"),
                                     (40, "XL"),
                                     (10, "X"),
                                     (9, "IX"),
                                     (5, "V"),
                                     (4, "IV"),
                                     (1, "I")]
        for item in romanConverterLegend {
            while (mutableInt >= item.0) {
                mutableInt -= item.0
                romanValue += item.1
            }
        }
        return romanValue
    }
}

extension String {
    var toInt: Int? {
        let formatter = NumberFormatter()
        if self.contains(".") || self.contains(","){
            formatter.numberStyle = .decimal
            formatter.roundingMode = .up 
            return formatter.number(from: self.trimmingCharacters(in: .whitespacesAndNewlines))?.intValue
        } else {
            formatter.numberStyle = .none
            return formatter.number(from: self.trimmingCharacters(in: .whitespacesAndNewlines))?.intValue
        }
    }
}


