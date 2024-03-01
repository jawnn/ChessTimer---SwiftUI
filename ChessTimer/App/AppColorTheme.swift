//
//  AppColorTheme.swift
//  ChessTimer
//
//  Created by Roberto Manese on 2/29/24.
//

import Foundation
import SwiftUI

enum AppTheme: String, Identifiable, CaseIterable {
    case yellow = "Yellow"
    case orange = "Orange"
    case green = "Green"
    case mint = "Mint"
    case teal = "Teal"
    case cyan = "Cyan"
    case blue = "Blue"
    case indigo = "Indigo"
    case purple = "Purple"
    
    var id: Self { self }
    
    var color: Color {
        switch self {
        case .yellow: return .yellow
        case .orange: return .orange
        case .green: return .green
        case .mint: return .mint
        case .teal: return .teal
        case .cyan: return .cyan
        case .blue: return .blue
        case .indigo: return .indigo
        case .purple: return .purple
        }
    }
}
