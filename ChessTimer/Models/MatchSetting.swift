//
//  MatchSetting.swift
//  ChessTimer
//
//  Created by Roberto Manese on 2/29/24.
//

import Foundation

enum MatchSetting: Int, CaseIterable, Identifiable {
    case oneMinute = 1
    case threeMinute = 2
    case fiveMinute = 3
    case tenMinute = 4
    
    var id: Self { self }
    
    var timeAmount: Int {
        switch self {
        case .oneMinute: return 3
        case .threeMinute: return 180
        case .fiveMinute: return 300
        case .tenMinute: return 600
        }
    }
    
    var title: String {
        switch self {
        case .oneMinute: return Constants.Text.oneMinute
        case .threeMinute: return Constants.Text.threeMinute
        case .fiveMinute: return Constants.Text.fiveMinute
        case .tenMinute: return Constants.Text.tenMinute
        }
    }
}
