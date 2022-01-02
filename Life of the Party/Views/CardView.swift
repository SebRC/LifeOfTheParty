//
//  CardView.swift
//  Life of the Party
//
//  Created by Sebastian Christiansen on 02/01/2022.
//

import SwiftUI

struct CardView: View {
    @Binding var player: Player
    @Binding var card: Card
    @Binding var showAnswer: Bool
    var emojis = [CardType.Trivia: "❓", CardType.Story: "📖", CardType.Lyrics: "🎶", CardType.Quote: "💬", CardType.Game: "🎮",]
    
    var body: some View {
        VStack {
            Text("\(player.name) \(player.emoji)").font(.title).padding().foregroundColor(.green)
            Text("\(card.type.rawValue) \(emojis[card.type]!)").font(.subheadline).padding().foregroundColor(.green)
            HStack {
                Text(card.description).font(.subheadline).padding().foregroundColor(.green)
                Text("Points: \(card.points)").font(.subheadline).padding().foregroundColor(.green)
            }
            if showAnswer {
                Text(card.answer).font(.subheadline).foregroundColor(.green)
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    @State static var activePlayer = Player(name: "Sebastian", emoji: "👨🏼‍💻")
    @State static private var activeCard = cards.randomElement()!
    @State static private var showAnswer = true
    static var previews: some View {
        CardView(player: $activePlayer, card: $activeCard, showAnswer: $showAnswer)
    }
}
