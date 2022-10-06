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
}
