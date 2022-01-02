//
//  TypeToggle.swift
//  Life of the Party
//
//  Created by Sebastian Christiansen on 02/01/2022.
//

import SwiftUI

struct TypeToggle: View {
    @Binding var state: Bool
    var title: String
    var description: String
    
    var body: some View {
        VStack {
            Toggle(title, isOn: $state)
            Text(description).font(.subheadline)
        }.padding()
    }
}

struct TypeToggle_Previews: PreviewProvider {
    @State static var state = true
    static var title = "Trivia"
    static var description = "Play with trivia questions about historical events, movies, music etc."
    
    static var previews: some View {
        TypeToggle(state: $state, title: title, description: description)
    }
}
