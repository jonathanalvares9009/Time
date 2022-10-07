//
//  Mood.swift
//  Time
//
//  Created by JONATHAN ALVARES on 06/10/22.
//

import SwiftUI

enum Mood: String, CaseIterable, Identifiable {
    case amazing, good, fine, terrible
    var id: Self { self }
    var themeColor: Theme {
        switch self {
            case .amazing: return Theme.sky
            case .good: return Theme.buttercup
            case .fine: return Theme.tan
            case .terrible: return Theme.poppy
        }
    }
}
