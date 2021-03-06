//
//  SettingsView.swift
//  Life of the Party
//
//  Created by Sebastian Christiansen on 02/01/2022.
//

import SwiftUI

struct SettingsView: View {
    @State private var playWithTrivia = true
    @State private var playWithStories = true
    @State private var playWithLyrics = true
    @State private var playWithGames = true
    @State private var playWithQuotes = true
    @State private var nameInput = ""
    @State private var players = [Player(name: "Sebastian", emoji: "๐จ๐ผโ๐ป"),
                          Player(name: "Emilie", emoji: "๐ฉ๐ผโโ๏ธ"),
                          Player(name: "Amalie", emoji: "๐ฉโ๐งโ๐ฆ"),]
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    TextField("Add Player", text: $nameInput).onSubmit {
                        if(!nameInput.isEmpty) {
                            players.append(Player(name: nameInput, emoji: "๐จ๐ผโ๐ป"))
                        }
                        print(players.count)
                    }.overlay(RoundedRectangle(cornerRadius: 5).stroke(.green, lineWidth: 2)).padding()
                    
                    if(!players.isEmpty) {
                        PlayerList(players: $players)
                    }
                    TypeToggle(state: $playWithTrivia, title: CardType.Trivia.rawValue, description: "Play with trivia questions about historical events, movies, music etc.")
                    TypeToggle(state: $playWithStories, title: CardType.Story.rawValue, description: "Play with personal stories from each player.")
                    TypeToggle(state: $playWithLyrics, title: CardType.Lyrics.rawValue, description: "Finish the lyrics from popular song.")
                    TypeToggle(state: $playWithQuotes, title: CardType.Quote.rawValue, description: "Finish famous quotes from throughout history.")
                    TypeToggle(state: $playWithGames, title: CardType.Game.rawValue, description: "Play with different types of quick games.")
                }
                
                NavigationLink("Confirm", destination: GameView(players: players, categories: constructCategories()))
            }.padding()
        }
    }
    
    func constructCategories() -> [CardType] {
        var categories = [CardType]()
        if(playWithGames) {
            categories.append(CardType.Game)
        }
        if(playWithQuotes) {
            categories.append(CardType.Quote)
        }
        if(playWithTrivia) {
            categories.append(CardType.Trivia)
        }
        if(playWithLyrics) {
            categories.append(CardType.Lyrics)
        }
        if(playWithStories) {
            categories.append(CardType.Story)
        }
        return categories
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
