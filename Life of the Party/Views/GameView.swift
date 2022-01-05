//
//  ContentView.swift
//  Life of the Party
//
//  Created by Sebastian Christiansen on 02/01/2022.
//

import SwiftUI

struct GameView: View {
    var players: [Player]
    var categories: [CardType]
    @State private var player = Player(name: "Sebastian", emoji: "👨🏼‍💻")
    @State private var card = cards.randomElement()!
    @State private var showAnswer = false
    @State private var previousPlayer = ""
    
    var body: some View {
        VStack {
            CardView(player: player, card: $card, showAnswer: $showAnswer)
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
                    card = getRandomCard()
                }.buttonStyle(.bordered).foregroundColor(.gray)
            }
        }.onAppear(perform: {
            card = getRandomCard()
            player = players.randomElement()!
        })
    }
    
    private func getRandomCard() -> Card {
        let filteredCards = cards.filter {
            return categories.contains($0.type)
        }
        return filteredCards.randomElement()!
    }
}

struct ContentView_Previews: PreviewProvider {
    @State static var playWithTrivia = true
    @State static var playWithStories = true
    @State static var playWithLyrics = true
    @State static var playWithGames = true
    @State static var playWithQuotes = true
    
    static var previews: some View {
        Group {
            GameView(players: [Player(name: "Sebastian", emoji: "👨🏼‍💻"),
                               Player(name: "Emilie", emoji: "👩🏼‍⚕️"),
                               Player(name: "Amalie", emoji: "👩‍👧‍👦")], categories: [CardType.Trivia, CardType.Story])
                .previewInterfaceOrientation(.portrait)
        }
    }
}
