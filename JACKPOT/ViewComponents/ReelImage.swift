//
//  ReelImage.swift
//  JACKPOT
//
//  Created by Time Ruchutrakool on 3/26/23.
//

import SwiftUI

struct ReelImage: View {
    let symbolImage: String
    var body: some View {
        Image(symbolImage)
            .resizable()
            .scaledToFit()
            .frame(width: 150)
            .shadow(radius: 16)
    }
}

struct ReelImage_Previews: PreviewProvider {
    static var previews: some View {
        ReelImage(symbolImage: Constant.symbols[0]).previewLayout(.sizeThatFits)
    }
}
