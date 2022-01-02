//
//  PlayerRow.swift
//  Life of the Party
//
//  Created by Sebastian Christiansen on 02/01/2022.
//

import SwiftUI

struct PlayerRow: View {
    var player: Player
    
    var body: some View {
        HStack {
            Text(player.name)
            Spacer()
            Text(player.emoji)
        }.padding()
    }
}

struct PlayerRow_Previews: PreviewProvider {
    static var previews: some View {
        PlayerRow(player: Player(name: "Sebastian", emoji: "👨🏼‍💻"))
    }
}
