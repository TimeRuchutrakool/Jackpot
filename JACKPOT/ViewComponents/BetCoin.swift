//
//  FooterView.swift
//  JACKPOT
//
//  Created by Time Ruchutrakool on 3/26/23.
//

import SwiftUI

struct BetCoin: View {
    let coin: String
    var body: some View {
        
            Text(coin)
                .footerCoinStyle()
                .padding(.horizontal,20)
                .padding(.vertical,10)
                .background(LinearGradient(colors: [Color("ColorDarkYellow"),Color("ColorLightYellow")], startPoint: .bottom, endPoint: .top))
                .clipShape(Capsule())
                .shadow(radius: 16)
                
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        BetCoin(coin: "100").background(.indigo)
    }
}
