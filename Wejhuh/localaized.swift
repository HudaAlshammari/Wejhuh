//
//  localaized.swift
//  Wejhuh
//
//  Created by Huda N S on 08/06/1443 AH.
//

import Foundation


// MARK: - extension for localaized

extension String {
    var localaized: String {
        return NSLocalizedString(self, comment: "")
    }
}
