//
//  MatchSettingSheet.swift
//  ChessTimer
//
//  Created by Roberto Manese on 2/29/24.
//

import SwiftUI

struct MatchSettingSheet: View {
    @State var vm: Game.ViewModel
    var body: some View {
        Form {
            Section(Constants.Header.timeControl) {
                List(MatchSetting.allCases) { setting in
                    HStack {
                        Text(setting.title)
                        Spacer()
                        if (setting == vm.matchSetting){
                            Image(systemName: Constants.SFSymbol.checkmark)
                                .foregroundStyle(vm.appTheme.color)
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        vm.isShowingMatchSettings.toggle()
                        vm.updateMatchSetting(with: setting.rawValue)
                        vm.resetMatch(for: setting)
                    }
                }
            }
            .presentationDetents([.fraction(0.30), .medium, .large])
        }
    }
}

#Preview {
    MatchSettingSheet(vm: Game.ViewModel())
}
