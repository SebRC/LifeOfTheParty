//
//  PlayerList.swift
//  Life of the Party
//
//  Created by Sebastian Christiansen on 02/01/2022.
//

import SwiftUI

struct PlayerList: View {
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    @Binding var players: [Player]
    var body: some View {
        List() {
            ForEach(players, id: \.id) { player in
                PlayerRow(player: player)
            }.onDelete(perform: delete)
        }.frame(minHeight: minRowHeight * CGFloat(players.count) * 2).overlay(RoundedRectangle(cornerRadius: 5).stroke(.green, lineWidth: 2)).padding()
    }
    
    func delete(at offsets: IndexSet) {
            players.remove(atOffsets: offsets)
        }
}

struct PlayerList_Previews: PreviewProvider {
    @State static var players = [Player(name: "Sebastian", emoji: "๐จ๐ผโ๐ป"),
                          Player(name: "Emilie", emoji: "๐ฉ๐ผโโ๏ธ"),
                          Player(name: "Amalie", emoji: "๐ฉโ๐งโ๐ฆ")]
    static var previews: some View {
        PlayerList(players: $players)
    }
}
