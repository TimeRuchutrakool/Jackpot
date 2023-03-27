//
//  JACKPOTTests.swift
//  JACKPOTTests
//
//  Created by Time Ruchutrakool on 3/26/23.
//

import XCTest

class When_Player_Choose_Amount_Of_Coin_For_Spinning: XCTestCase {

    func test_make_sure_player_bet_10_coins(){
        let amountOfBet = 10
        XCTAssertEqual(10, amountOfBet)
    }
   
    func test_make_sure_player_bet_20_coins(){
        let amountOfBet = 20
        XCTAssertEqual(20, amountOfBet)
    }
    
    func test_make_sure_player_bet_30_coins(){
        let amountOfBet = 20
        XCTAssertEqual(20, amountOfBet)
    }
    
}

class When_Player_Spin_Slot: XCTestCase{
    
    func test_make_sure_player_win(){
        let firstSpin = "1"
        let secondSpin = "1"
        let thirdSpin = "1"
        
        XCTAssertEqual(firstSpin, secondSpin)
        XCTAssertEqual(secondSpin, thirdSpin)
        XCTAssertEqual(thirdSpin, firstSpin)
    }
    
    func test_add_coin_when_player_win(){
        
        let coin = 100
        let amountOfBet = 10
        
        XCTAssertEqual(110, coin + amountOfBet)
        
    }
    
    func test_deduct_coin_when_player_lose(){
        
        let coin = 100
        let amountOfBet = 10
        
        XCTAssertEqual(90, coin - amountOfBet)
        
    }
    
    func test_game_over_when_player_out_of_coin(){
        let coin = 0
        
        XCTAssertTrue(coin <= 0)
    }
}

class When_Player_Play_New_Game: XCTestCase{
    
    func test_reset_player_coin(){
        var coin = 0
        
        coin = 100
        XCTAssertEqual(100, coin)
        
    }
    
}

class When_Player_Reset_Game: XCTestCase{
    
    func test_player_reset_game(){
        
        var score = 100
        var coin = 0
        
        score = 0
        coin = 100
        
        XCTAssertEqual(0, score)
        XCTAssertEqual(100, coin)
        
    }
    
}
