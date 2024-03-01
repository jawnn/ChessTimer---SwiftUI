//
//  AppThemeSheet.swift
//  ChessTimer
//
//  Created by Roberto Manese on 2/29/24.
//

import SwiftUI

struct AppThemeSheet: View {
    @State var vm: Game.ViewModel
    var body: some View {
        Form {
            Section(Constants.Header.colorTheme) {
                List(AppTheme.allCases) { theme in
                    HStack {
                        Rectangle()
                            .fill(theme.color)
                            .frame(width: 20, height: 20)
                        Text(theme.rawValue)
                        Spacer()
                        if (vm.appTheme == theme) {
                            Image(systemName: Constants.SFSymbol.checkmark)
                                .foregroundStyle(vm.appTheme.color)
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        vm.isShowingAppSettings.toggle()
                        vm.updateAppTheme(with: theme.rawValue)
                    }
                }
            }
        }
        .presentationDetents([.medium, .large])
    }
}

#Preview {
    AppThemeSheet(vm: Game.ViewModel())
}
