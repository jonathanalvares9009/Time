//
//  Mood.swift
//  Time
//
//  Created by JONATHAN ALVARES on 06/10/22.
//

import SwiftUI

enum Mood: String, CaseIterable, Identifiable, Codable {
    case amazing
    case good
    case fine
    case not_good
    case terrible
    
    var name: String {
        rawValue.capitalized
    }
    
    var id: String {
        name
    }
}

var moods: [String] {
    ["Amazing", "Good", "Fine", "Not good", "Terrible"]
}
