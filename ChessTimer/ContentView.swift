//
//  ContentView.swift
//  ChessTimer
//
//  Created by Roberto Manese on 2/27/24.
//

import Observation
import SwiftUI
import Combine

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var vm = Game.ViewModel()
    
    var body: some View {
        ZStack {
            if colorScheme == .light {
                Color.white
                    .ignoresSafeArea()
            } else {
                Color.black
                    .ignoresSafeArea()
            }
            
            Game()
            
        }
    }
}

#Preview {
    ContentView()
}


