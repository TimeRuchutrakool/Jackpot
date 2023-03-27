//
//  Chips.swift
//  JACKPOT
//
//  Created by Time Ruchutrakool on 3/26/23.
//

import SwiftUI

struct Chips: View {
    var body: some View {
        Image("chips")
            .resizable()
            .scaledToFit()
            .frame(width: 50)
            .shadow(radius: 16)
            .padding(.bottom,10)
    }
}

struct Chips_Previews: PreviewProvider {
    static var previews: some View {
        Chips()
    }
}
