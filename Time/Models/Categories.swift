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
}
