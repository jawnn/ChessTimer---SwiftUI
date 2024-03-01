//
//  Game+ViewModel.swift
//  ChessTimer
//
//  Created by Roberto Manese on 2/29/24.
//

import Foundation
import Observation
import SwiftUI

extension Game {
    
    @Observable
    class ViewModel {
        var isShowingResetClockAlert: Bool = false
        var isShowingMatchSettings: Bool = false
        var isShowingAppSettings: Bool = false
        
        var appTheme: AppTheme = .green
        var matchSetting: MatchSetting = .oneMinute
        
        var hasGameStarted: Bool = false
        var isGamePaused: Bool = false
        var hasGameEnded: Bool = false
        
        var player1 = PlayerViewModel(matchSetting: .oneMinute)
        var player2 = PlayerViewModel(matchSetting: .oneMinute)
        
        func getAppTheme() {
            guard let colorString = UserDefaults.standard.value(forKey: Constants.UserDefaultKey.appTheme) as? String,
                  let theme = AppTheme(rawValue: colorString) else {
                    appTheme = .green
                    return
            }
            appTheme = theme
        }
        
        func updateAppTheme(with color: String) {
            guard let newTheme = AppTheme(rawValue: color) else {
                return
            }
            UserDefaults.standard.setValue(color, forKey: Constants.UserDefaultKey.appTheme)
            appTheme = newTheme
        }
        
        func getMatchSetting() {
            guard let storedSettings = UserDefaults.standard.value(forKey: Constants.UserDefaultKey.matchSetting) as? Int,
                  let setting = MatchSetting(rawValue: storedSettings) else {
                print("nothing set")
                return
            }
            matchSetting = setting
            resetMatch(for: matchSetting)   
        }
        
        func updateMatchSetting(with setting: Int) {
            guard let newSetting = MatchSetting(rawValue: setting) else {
                print("Couldn't save setting")
                return
            }
            UserDefaults.standard.setValue(setting, forKey: Constants.UserDefaultKey.matchSetting)
            matchSetting = newSetting
        }
        
        func startGame(for player: PlayerViewModel) {
            hasGameStarted = true
            player.resumeTimer()
            player.isTurn = true
            player.cardState = .isTurn
        }
        
        func pauseGame() {
            print(hasGameStarted)
            print(isGamePaused)
            guard hasGameStarted else {
                print("game no start, don't pause")
                return
            }
            isGamePaused = true
            updateForPause()
        }
        
        func pauseOrResumeGame() {
            isGamePaused.toggle()
            if isGamePaused {
                updateForPause()
            } else {
                updateForResume()
            }
        }
        
        func updateForPause() {
            player1.cardState = .pause
            if (player1.isTurn) { player1.pauseTimer() }
            
            player2.cardState = .pause
            if (player2.isTurn) { player2.pauseTimer() }
        }
        
        func updateForResume() {
            player1.cardState = player1.isTurn ? .isTurn : .pause
            if (player1.isTurn) { player1.resumeTimer() }
            
            player2.cardState = player2.isTurn ? .isTurn : .pause
            if (player2.isTurn) { player2.resumeTimer() }
        }
        
        func changeTurns(from: PlayerViewModel, to: PlayerViewModel) {
            from.moveCount += 1
            from.isTurn = false
            from.cardState = .pause
            from.pauseTimer()
            
            to.isTurn = true
            to.cardState = .isTurn
            to.resumeTimer()
        }
        
        func updateTimeRemaining(player: PlayerViewModel) {
            if player.timeRemaining > 0 {
                player.timeRemaining -= 1
                if player.timeRemaining == 0 {
                    player.cardState = .noTime
                    hasGameEnded = true
                    hasGameStarted = false
                }
            }
        }
        
        func resetMatch(for setting: MatchSetting) {
            isGamePaused = false
            hasGameStarted = false
            hasGameEnded = false
            matchSetting = setting
            player1.resetPlayer(for: setting)
            player2.resetPlayer(for: setting)
        }
    }
    
}
