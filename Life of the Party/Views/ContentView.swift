//
//  ContentView.swift
//  Life of the Party
//
//  Created by Sebastian Christiansen on 02/01/2022.
//

import SwiftUI

struct GameView: View {
    var players = ["Sebastian 👨🏼‍💻", "Amalie 👩‍👧‍👦", "Emilie 👩🏼‍⚕️", "Jonas 👨🏻‍⚖️"]
    @State private var player = "Player"
    @State private var card = cards.randomElement()!
    @State private var showAnswer = false
    
    var body: some View {
        VStack {
            CardView(player: $player, card: $card, showAnswer: $showAnswer)
            Divider()
            Spacer()
            HStack(alignment: .bottom, spacing: 50) {
                Button(showAnswer ? "Hide answer" : "Show answer") {
                    showAnswer = !showAnswer
                }.buttonStyle(.bordered).foregroundColor(.gray)
                Button("Next question") {
                    showAnswer = false
                    player = players.randomElement()!
                    card = cards.randomElement()!
                }.buttonStyle(.bordered).foregroundColor(.gray)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GameView()
                .previewInterfaceOrientation(.portrait)
        }
    }
}
