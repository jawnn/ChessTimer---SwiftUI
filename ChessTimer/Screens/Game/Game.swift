//
//  Game.swift
//  ChessTimer
//
//  Created by Roberto Manese on 2/29/24.
//

import SwiftUI

struct Game: View {
    @State private var vm = Game.ViewModel()
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            PlayerTimeCard(viewModel: vm.player1)
                .rotationEffect(.degrees(180))
                .onTapGesture {
                    guard !vm.hasGameEnded else {
                        return
                    }
                    
                    guard !vm.isGamePaused else{
                        return
                    }
                    
                    guard vm.hasGameStarted else {
                        vm.startGame(for: vm.player2)
                        return
                    }
                    
                    if vm.player1.isTurn {
                        vm.changeTurns(from: vm.player1, to: vm.player2)
                    }
                }
                .onReceive(vm.player1.timer) { _ in
                    guard vm.hasGameStarted else {
                        vm.player1.timer.upstream.connect().cancel()
                        return
                    }
                    
                    vm.updateTimeRemaining(player: vm.player1)
                }
            
            MiddleButtonMenu(vm: vm)
            
            
            PlayerTimeCard(viewModel: vm.player2)
                .onTapGesture {
                    guard !vm.hasGameEnded else {
                        return
                    }
                    
                    guard !vm.isGamePaused else{
                        return
                    }
                    
                    guard vm.hasGameStarted else {
                        vm.startGame(for: vm.player1)
                        return
                    }
                    
                    if vm.player2.isTurn {
                        vm.changeTurns(from: vm.player2, to: vm.player1)
                    }
                    
                }
                .onReceive(vm.player2.timer) { _ in
                    guard vm.hasGameStarted else {
                        vm.player2.timer.upstream.connect().cancel()
                        return
                    }
                    
                    vm.updateTimeRemaining(player: vm.player2)
                }
        }
        .task {
            vm.getAppTheme()
            vm.getMatchSetting()
        }
        .sheet(isPresented: $vm.isShowingAppSettings) {
            AppThemeSheet(vm: vm)
        }
        .sheet(isPresented: $vm.isShowingMatchSettings) {
            MatchSettingSheet(vm: vm)
        }
        .alert(Constants.Text.resetClock, isPresented: $vm.isShowingResetClockAlert) {
            Button(Constants.Text.confirm, role: .destructive) {
                vm.resetMatch(for: vm.matchSetting)
            }
            Button(Constants.Text.cancel, role: .cancel) {
                vm.pauseGame()
            }
        }
        .padding(.vertical)
    }
}

#Preview {
    Game()
}
