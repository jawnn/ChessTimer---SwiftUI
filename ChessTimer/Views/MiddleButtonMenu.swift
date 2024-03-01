//
//  MiddleButtonMenu.swift
//  ChessTimer
//
//  Created by Roberto Manese on 3/1/24.
//

import SwiftUI

struct MiddleButtonMenu: View {
    @State var vm: Game.ViewModel
    var body: some View {
        HStack {
            Button {
                vm.isShowingResetClockAlert = true
                if (!vm.hasGameEnded && !vm.isGamePaused) {
                    vm.isGamePaused = true
                    vm.updateForPause()
                }
            } label: {
                CTIcon(systemName: Constants.SFSymbol.arrowClockwise, color: vm.appTheme.color)
            }
            
            if (vm.hasGameStarted || vm.hasGameEnded) {
                Button {
                    vm.pauseOrResumeGame()
                } label: {
                    CTIcon(
                        systemName: vm.isGamePaused ? Constants.SFSymbol.playFill : Constants.SFSymbol.pauseFill,
                        color: vm.appTheme.color
                    )
                }
                .disabled(vm.hasGameEnded)
            }
            
            Spacer()
            Text(vm.matchSetting.title)
                .font(.title)
                .fontWeight(.semibold)
            Spacer()
            
            Button {
                vm.isShowingMatchSettings = true
            } label: {
                CTIcon(systemName: Constants.SFSymbol.clockFill, color: vm.appTheme.color)
            }
            .disabled(vm.hasGameStarted)
            
            Button {
                vm.isShowingAppSettings = true
            } label: {
                CTIcon(systemName: Constants.SFSymbol.paintPaletteFill, color: vm.appTheme.color)
            }
            .disabled(vm.hasGameStarted)
        }
        .padding()
    }
}

#Preview {
    MiddleButtonMenu(vm: Game.ViewModel())
}
