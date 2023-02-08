//
//  DecimalUtils.swift
//  Bankey
//
//  Created by Ingra Cristina on 08/02/23.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
