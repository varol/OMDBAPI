//
//  String+Extension.swift
//  Movie
//
//  Created by Varol on 12.08.2020.
//  Copyright © 2020 Varol. All rights reserved.
//

import UIKit

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}

extension String {
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
}
