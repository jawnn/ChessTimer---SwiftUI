//
//  Constants.swift
//  ChessTimer
//
//  Created by Roberto Manese on 2/29/24.
//

import Foundation

struct Constants {
    
    struct UserDefaultKey {
        static let appTheme: String = "AppTheme"
        static let matchSetting: String = "MatchSetting"
    }
    
    struct Header {
        static let timeControl = "Time Control"
        static let colorTheme = "Color Theme"
    }
    
    struct Text {
        static let cancel:      String = "Cancel"
        static let confirm:      String = "Confirm"
        static let resetClock:      String = "Reset Clock"
        static let moves: String = "Moves"
        
        static let oneMinute:   String = "1 Min"
        static let threeMinute: String = "3 Min"
        static let fiveMinute:  String = "5 Min"
        static let tenMinute:   String = "10 Min"
    
    }
    
    struct SFSymbol {
        static let arrowClockwise: String = "arrow.clockwise"
        static let checkmark: String = "checkmark"
        static let clockFill: String = "clock.fill"
        static let paintPaletteFill: String = "paintpalette.fill"
        static let pauseFill: String = "pause.fill"
        static let playFill: String = "play.fill"
    }
    
    struct Font {
        static let SFPro: String = "SFPro"
    }
}
