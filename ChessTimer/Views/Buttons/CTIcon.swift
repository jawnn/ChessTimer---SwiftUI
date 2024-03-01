//
//  CTButton.swift
//  ChessTimer
//
//  Created by Roberto Manese on 2/29/24.
//

import SwiftUI

struct CTIcon: View {
    let systemName: String
    let color: Color
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .bold()
            .tint(color)
            .padding(8)
    }
}

#Preview {
    CTIcon(systemName: Constants.SFSymbol.checkmark, color: .blue)
}
