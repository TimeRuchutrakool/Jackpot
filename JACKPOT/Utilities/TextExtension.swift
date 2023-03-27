//
//  TextExtension.swift
//  JACKPOT
//
//  Created by Time Ruchutrakool on 3/26/23.
//

import SwiftUI

extension Text{
    func scoreAndCoinLabelStyle() -> Text {
        self.foregroundColor(.white)
            .font(.system(size: 15,design: .rounded))
            .fontWeight(.heavy)
            
    }
    
    func scoreAndCoinValueStyle() -> Text{
        self.foregroundColor(.white)
            .font(.system(size: 35,design: .rounded))
            .fontWeight(.heavy)
    }
    
    func footerCoinStyle() -> Text{
        self.foregroundColor(.white)
            .font(.system(size: 20,design: .rounded))
            .fontWeight(.heavy)
    }
}
