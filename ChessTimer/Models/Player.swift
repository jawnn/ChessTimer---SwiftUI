//
//  Player.swift
//  ChessTimer
//
//  Created by Roberto Manese on 2/29/24.
//


import Observation
import SwiftUI

@Observable
class PlayerViewModel {
    enum CardState {
        case pause, isTurn, noTime
        
        var color: Color {
            switch self {
            case .pause: return .gray
            case .isTurn:
                guard let x = UserDefaults.standard.value(forKey: Constants.UserDefaultKey.appTheme) as? String,
                      let y = AppTheme(rawValue: x)?.color else {
                    return .green
                }
                return y
            case .noTime: return .red
            }
        }
    }
    
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var moveCount = 0
    var isTurn = false
    var timeRemaining: Int
    var cardState: CardState = .pause
    
    init(matchSetting: MatchSetting) {
        self.timeRemaining = matchSetting.timeAmount
    }
    
    func resumeTimer() {
        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    }
    
    func pauseTimer() {
        timer.upstream.connect().cancel()
    }
    
    func resetPlayer(for setting: MatchSetting) {
        pauseTimer()
        moveCount = 0
        isTurn = false
        timeRemaining = setting.timeAmount
        cardState = .pause
    }
}
