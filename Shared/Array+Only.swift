//
//  Array+Only.swift
//  Memorize
//
//  Created by Muhammad Anjum Kaiser on 20/10/2020.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
