//
//  Reel.swift
//  JACKPOT
//
//  Created by Time Ruchutrakool on 3/25/23.
//

import SwiftUI

struct Reel: View {
    var body: some View {
        Image("reel")
            .resizable()
            .scaledToFit()
            .frame(width: 150)
            .shadow(radius: 16)
            
    }
}

struct Reel_Previews: PreviewProvider {
    static var previews: some View {
        Reel()
    }
}
