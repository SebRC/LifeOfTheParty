//
//  ContentView.swift
//  Life of the Party
//
//  Created by Sebastian Christiansen on 02/01/2022.
//

import SwiftUI

struct GameView: View {
    var players: [Player]
    @State var player: Player
    @State private var card = cards.randomElement()!
    @State private var showAnswer = false
    @State private var previousPlayer = ""
    
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
                    previousPlayer = player.name
                    player = players.randomElement()!
                    while(player.name == previousPlayer) {
                        player = players.randomElement()!
                    }
                    card = cards.randomElement()!
                }.buttonStyle(.bordered).foregroundColor(.gray)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GameView(players: [Player(name: "Sebastian", emoji: "👨🏼‍💻"),
                               Player(name: "Emilie", emoji: "👩🏼‍⚕️"),
                               Player(name: "Amalie", emoji: "👩‍👧‍👦")], player: Player(name: "Sebastian", emoji: "👨🏼‍💻"))
                .previewInterfaceOrientation(.portrait)
        }
    }
}
