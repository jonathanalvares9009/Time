//
//  File.swift
//  Time
//
//  Created by JONATHAN ALVARES on 08/10/22.
//

import SwiftUI

enum Category: String, CaseIterable, Identifiable {
    case study, hobby, work, college, family, random, vacation, play, mobile, sleep, free_time
    var id: Self { self }
    var name: String {
        if self == Category.free_time {
            return "Free Time"
        }
        return rawValue.capitalized
    }
    var color: Color {
        switch self {
            case .study: return Color.blue
            case .college: return Color.green
            case .free_time: return Color.gray
            case .hobby: return Color.brown
            case .work: return Color.cyan
            case .family: return Color.indigo
            case .random: return Color.teal
            case .vacation: return Color.orange
            case .play: return Color.mint
            case .mobile: return Theme.magenta.mainColor
            case .sleep: return Theme.buttercup.mainColor
        }
    }
}
