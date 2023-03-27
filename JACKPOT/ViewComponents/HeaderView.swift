//
//  HeaderView.swift
//  JACKPOT
//
//  Created by Time Ruchutrakool on 3/25/23.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        

        
            Text("JACKPOT")
                .font(.system(size: 60,design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(Color("ColorLightYellow"))
                .shadow(color: Color("ColorDarkYellow"),radius: 0.1,x:5,y: 5)
                .padding(.top,40)
                .accessibilityIdentifier("jackpot")
        
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .background(Color.indigo)
    }
}
