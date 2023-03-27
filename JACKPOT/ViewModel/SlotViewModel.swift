//
//  Slot.swift
//  JACKPOT
//
//  Created by Time Ruchutrakool on 3/26/23.
//

import Foundation

class SlotViewModel: ObservableObject{
    
    @Published var reels: Array = [0,1,2]
    @Published var coins: Int = 100
    @Published var score: Int = UserDefaults.standard.integer(forKey: "score")
    @Published var showModal: Bool = false
    
    private var amontOfBet: Int = 10
    @Published var bet10Coin: Bool = true
    @Published var bet20Coin: Bool = false
    @Published var bet30Coin: Bool = false
    
    func randomReels(){
        reels = reels.map({_ in
            Int.random(in: 0..<Constant.symbols.count)
        })
    }
    
    func choose10Bet(){
        amontOfBet = 10
        bet20Coin = false
        bet30Coin = false
    }
    func choose20Bet(){
        amontOfBet = 20
        bet10Coin = false
        bet30Coin = false
    }
    func choose30Bet(){
        amontOfBet = 30
        bet10Coin = false
        bet20Coin = false
    }
    
    func checkWining(){
        if reels[0] == reels[1] && reels[1] == reels[2] && reels[2] == reels[0]{
            addCoinForWinner()
            newHighScore()
        }
        else{
            deductCoinForLoser()
        }
    }
    func addCoinForWinner(){
        coins += amontOfBet * 5
    }
    func deductCoinForLoser(){
        coins -= amontOfBet
    }
    func newHighScore(){
        if coins >= score{
            score = coins
            UserDefaults.standard.set(score, forKey: "score")
        }
    }
    func isGameOver(){
        if coins <= 0{
            coins = 0
            showModal = true
        }
    }
    func newGame(){
        showModal = false
        coins = 100
        
    }
    func resetGame(){
        score = 0
        coins = 100
        UserDefaults.standard.set(score, forKey: "score")
    }
}
