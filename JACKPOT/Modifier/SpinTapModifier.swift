//
//  SpinTapModifier.swift
//  JACKPOT
//
//  Created by Time Ruchutrakool on 3/26/23.
//

import SwiftUI

struct SpinTapModifier: ViewModifier{
    
    var onPress: () -> Void
    var onEnded: () -> Void
    
    func body(content: Content) -> some View {
        content
            .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged({ _ in
                    onPress()
                })
                .onEnded({ _ in
                    onEnded()
                })
            )
    }
}

extension View{
    func pressAnimation(onpress: @escaping () -> (), onEnded: @escaping () -> ()) -> some View {
        modifier(SpinTapModifier(onPress: {onpress()}, onEnded: {onEnded()}))
    }
}
