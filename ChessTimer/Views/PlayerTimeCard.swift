//
//  PlayerTimeCard.swift
//  ChessTimer
//
//  Created by Roberto Manese on 2/29/24.
//

import SwiftUI

struct PlayerTimeCard: View {
    @State var viewModel: PlayerViewModel

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Text("\(Constants.Text.moves): \(viewModel.moveCount)")
                        .padding()
                }
                Spacer()
                Text(convertToTimeString(seconds: viewModel.timeRemaining))
                    .font(.custom(Constants.Font.SFPro, size: 100))
                    .bold()
                Spacer()
            }
        }
        .contentShape(Rectangle())
        .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.size.height/2 - 80)
        .background(viewModel.cardState.color)
        .cornerRadius(8)
    }
    
    private func convertToTimeString(seconds: Int) -> String {
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60
        return String(format: "%02d:%02d", minutes, remainingSeconds)
    }
}

#Preview {
    PlayerTimeCard(viewModel: PlayerViewModel(matchSetting: .oneMinute))
}
