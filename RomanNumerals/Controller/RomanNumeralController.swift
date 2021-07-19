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
        guard let intToConvert = Int.toInt, intToConvert <= 99999 else {
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
        guard let intValue = Int(self.trimmingCharacters(in: .whitespacesAndNewlines)) else {
            print("cannot convert String to Int")
            return nil
        }
        return intValue
    }
}


