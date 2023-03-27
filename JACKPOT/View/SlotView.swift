//
//  ContentView.swift
//  JACKPOT
//
//  Created by Time Ruchutrakool on 3/25/23.
//

import SwiftUI

struct SlotView: View {
    
    @StateObject var slot: SlotViewModel = SlotViewModel()
    @State private var isAnimating = false
    @State private var isTapSpin = false
    
    var body: some View {
        ZStack{
            
            //MARK: - BACKGROUND
            LinearGradient(colors: [Color("ColorDarkYellow"),Color("ColorLightYellow")], startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack{
                //MARK: - HEADER
                HeaderView()
                    .opacity(isAnimating ? 1 : 0.5)
                    .offset(y: isAnimating ? 0 : -20)
                    .animation(.easeIn(duration: 0.7), value: isAnimating)
                
                
                Spacer()
                //MARK: - SCORE + COIN
                
                HStack{
                    HStack {
                        Text("Your\ncoin".uppercased())
                            .scoreAndCoinLabelStyle()
                            .multilineTextAlignment(.trailing)
                        Text("\(slot.coins)")
                            .scoreAndCoinValueStyle()
                            .accessibilityIdentifier("coin")
                        
                    }.padding(.horizontal,10)
                        .frame(maxWidth: 150)
                        .background(.black.opacity(0.4))
                        .clipShape(Capsule())
                        .padding(.horizontal)
                    
                    Spacer()
                    HStack {
                        Text("\(slot.score)")
                            .scoreAndCoinValueStyle()
                            .accessibilityIdentifier("score")
                        Text("High\nScore".uppercased())
                            .scoreAndCoinLabelStyle()
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.horizontal,10)
                    .frame(maxWidth: 150)
                    .background(.black.opacity(0.4))
                    .clipShape(Capsule())
                    .padding(.horizontal)
                }
                .opacity(isAnimating ? 1 : 0.5)
                .offset(y: isAnimating ? 0 : -5)
                .animation(.easeIn(duration: 0.7), value: isAnimating)
                
                //MARK: - REELS
                
                //MARK: - FIRST REEL
                ZStack {
                    Reel()
                    ReelImage(symbolImage: Constant.symbols[slot.reels[0]])
                        .opacity(isAnimating ? 1 : 0)
                        .offset(y : isAnimating ? 0 : -5)
                        .animation(.easeIn(duration: 0.6), value: isAnimating)
                }
                
                HStack {
                    //MARK: - SECOND REEL
                    ZStack {
                        Reel()
                        ReelImage(symbolImage: Constant.symbols[slot.reels[1]])
                            .opacity(isAnimating ? 1 : 0)
                            .offset(y : isAnimating ? 0 : -3)
                            .animation(.easeIn(duration: 0.5), value: isAnimating)
                    }
                    
                    
                    //MARK: - THIRD REEL
                    ZStack {
                        Reel()
                        ReelImage(symbolImage: Constant.symbols[slot.reels[2]])
                            .opacity(isAnimating ? 1 : 0)
                            .offset(y : isAnimating ? 0 : -7)
                            .animation(.easeIn(duration: 0.4), value: isAnimating)
                    }
                    
                }
                //MARK: - SPIN
                
                Image("spin")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .shadow(radius: 16)
                    .scaleEffect(x: isTapSpin ? 1.5 : 1,y: isTapSpin ? 1.5 : 1)
                    .accessibilityIdentifier("spinButton")
                    .pressAnimation {
                    withAnimation(.easeIn(duration: 0.5)){
                        isTapSpin = true
                    }
                } onEnded: {
                    withAnimation(.easeIn(duration: 0.5)){
                        isTapSpin = false
                        slot.randomReels()
                        slot.checkWining()
                        slot.isGameOver()
                    }
                }
                

                    
                Spacer()
                
                //MARK: - FOOTER
                HStack{
                    Spacer()
                    VStack(alignment: .center) {
                        Chips()
                            .opacity(slot.bet30Coin ? 1 : 0)
                            .animation(.easeIn(duration: 0.2), value: slot.bet30Coin)
                        BetCoin(coin: "30")
                            .accessibilityIdentifier("bet30Coin")
                    }
                    .onTapGesture {
                        slot.bet30Coin = true
                        slot.choose30Bet()
                    }
                   
                    Spacer()
                    VStack {
                        Chips()
                            .opacity(slot.bet20Coin ? 1 : 0)
                            .animation(.easeIn(duration: 0.2), value: slot.bet20Coin)
                        BetCoin(coin: "20")
                            .accessibilityIdentifier("bet20Coin")
                    }
                    .onTapGesture {
                        slot.bet20Coin = true
                        slot.choose20Bet()
                    }
                    
                    Spacer()
                    VStack {
                        Chips()
                            .opacity(slot.bet10Coin ? 1 : 0)
                            .animation(.easeIn(duration: 0.2), value: slot.bet10Coin)
                        BetCoin(coin: "10")
                    }
                    .onTapGesture {
                        slot.bet10Coin = true
                        slot.choose10Bet()
                    }
                    Spacer()
                }
                .padding(.bottom)
                .opacity(isAnimating ? 1 : 0.5)
                .offset(y: isAnimating ? 0 : 20)
                .animation(.easeIn(duration: 0.7), value: isAnimating)
            }
            .overlay(
                Button(action: {
                    //reset highscore
                    slot.resetGame()
                }, label: {
                    HStack {
                        Text("Reset")
                            .foregroundColor(.white)
                            .font(.system(size: 15,design: .rounded))
                            .fontWeight(.heavy)
                        Image(systemName: "goforward")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                        .bold()
                    }
                })
                .accessibilityIdentifier("resetButton")
                .padding(.trailing)
                ,alignment: .topTrailing
            )
            .blur(radius: slot.showModal ? 3 : 0)
            //MARK: - MODAL
            
            if slot.showModal{
                ZStack{
                    Color(.black).opacity(0.2).edgesIgnoringSafeArea(.all)
                    VStack{
                        Text("Game Over")
                            .font(.system(size: 35,design: .rounded))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding(.vertical,5)
                            .frame(maxWidth: .infinity)
                            .background(LinearGradient(colors: [Color("ColorDarkYellow"),Color("ColorLightYellow")], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .accessibilityIdentifier("gameOver")
                        Spacer()
                        
                        Text("Unfortunately! You lost all of the coins. Let's play again!")
                            .font(.system(size: 20,design: .rounded))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                        Spacer()
                        
                        Button {
                            slot.newGame()
                            
                        } label: {
                            Text("Play Again")
                                .font(.system(size: 20,design: .rounded))
                                .fontWeight(.heavy)
                                .padding()
                                .background(Capsule().strokeBorder(lineWidth: 5))
                                .tint(Color("ColorDarkYellow"))
                                .accessibilityIdentifier("playAgainButton")
                        }
                        
                        Spacer()
                    }.frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 260, idealHeight: 280, maxHeight: 320, alignment: .center)
                        .background(.white)
                        .cornerRadius(30)
                }
            }
        }
        .onAppear(){
            isAnimating = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SlotView()
    }
}
