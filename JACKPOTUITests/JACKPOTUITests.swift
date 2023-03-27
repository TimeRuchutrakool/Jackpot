//
//  JACKPOTUITests.swift
//  JACKPOTUITests
//
//  Created by Time Ruchutrakool on 3/27/23.
//

import XCTest

class When_Slot_View_Is_Shown: XCTestCase{
    
    private var app: XCUIApplication!
    private var slotViewPage: SlotViewPage!
    override func setUp() {
        app = XCUIApplication()
        slotViewPage = SlotViewPage(app: app)
        continueAfterFailure = false
        app.launch()
        
        XCTAssertEqual("JACKPOT", slotViewPage.jackpotText.label)
    }
    
}

class When_Player_Spin_Slot:XCTestCase{
    
    private var app: XCUIApplication!
    private var slotViewPage: SlotViewPage!
    override func setUp() {
        app = XCUIApplication()
        slotViewPage = SlotViewPage(app: app)
        continueAfterFailure = false
        app.launch()
    }
    
    func test_should_make_sure_spin_the_slot(){
        
        let spinButton = slotViewPage.spinButton
        for _ in 0...15{
            spinButton.tap()
        }
        XCTAssertEqual("Game Over", slotViewPage.gameOverText.label)
    }
    
    func test_should_make_sure_player_press_play_again_button(){
        
        let spinButton = slotViewPage.spinButton
        for _ in 0...15{
            spinButton.tap()
        }
        let playAgainButton = slotViewPage.playAgainButton
        playAgainButton.tap()
        XCTAssertEqual("100", slotViewPage.coinText.label)
    }
    
    override func tearDown() {
        Springboard.deleteApp()
    }
}

class When_Player_Spin_Slot_And_Bet_20_Coins:XCTestCase{
    
    private var app: XCUIApplication!
    private var slotViewPage: SlotViewPage!
    override func setUp() {
        app = XCUIApplication()
        slotViewPage = SlotViewPage(app: app)
        continueAfterFailure = false
        app.launch()
    }
    
    func test_make_sure_player_select_bet_20_coins(){
        let bet20coins = slotViewPage.bet20Coin
        
        bet20coins.tap()
        XCTAssertEqual("20", bet20coins.label)
    }
    
    func test_should_make_sure_spin_the_slot(){
        let bet20coins = slotViewPage.bet20Coin
        bet20coins.tap()
        let spinButton = slotViewPage.spinButton
        for _ in 0...15{
            spinButton.tap()
        }
        XCTAssertEqual("Game Over", slotViewPage.gameOverText.label)
    }
    func test_should_make_sure_player_press_play_again_button(){
        let bet20coins = slotViewPage.bet20Coin
        bet20coins.tap()
        let spinButton = slotViewPage.spinButton
        for _ in 0...15{
            spinButton.tap()
        }
        let playAgainButton = slotViewPage.playAgainButton
        playAgainButton.tap()
        XCTAssertEqual("100", slotViewPage.coinText.label)
    }
    override func tearDown() {
        Springboard.deleteApp()
    }
    
}

class When_Player_Spin_Slot_And_Bet_30_Coins:XCTestCase{
    
    private var app: XCUIApplication!
    private var slotViewPage: SlotViewPage!
    override func setUp() {
        app = XCUIApplication()
        slotViewPage = SlotViewPage(app: app)
        continueAfterFailure = false
        app.launch()
    }
    
    func test_make_sure_player_select_bet_30_coins(){
        let bet30coins = slotViewPage.bet30Coin
        
        bet30coins.tap()
        XCTAssertEqual("30", bet30coins.label)
    }
    
    func test_should_make_sure_spin_the_slot(){
        let bet30coins = slotViewPage.bet30Coin
        bet30coins.tap()
        let spinButton = slotViewPage.spinButton
        for _ in 0...15{
            spinButton.tap()
        }
        XCTAssertEqual("Game Over", slotViewPage.gameOverText.label)
    }
    func test_should_make_sure_player_press_play_again_button(){
        let bet30coins = slotViewPage.bet30Coin
        bet30coins.tap()
        let spinButton = slotViewPage.spinButton
        for _ in 0...15{
            spinButton.tap()
        }
        let playAgainButton = slotViewPage.playAgainButton
        playAgainButton.tap()
        XCTAssertEqual("100", slotViewPage.coinText.label)
    }
    override func tearDown() {
        Springboard.deleteApp()
    }
}

class When_Player_Reset_Game: XCTestCase{
    
    private var app: XCUIApplication!
    private var slotViewPage: SlotViewPage!
    override func setUp() {
        app = XCUIApplication()
        slotViewPage = SlotViewPage(app: app)
        continueAfterFailure = false
        app.launch()
    }
    
    func test_make_sure_reset_game(){
        let spinButton = slotViewPage.spinButton
        for _ in 0...15{
            spinButton.tap()
        }
        let playAgainButton = slotViewPage.playAgainButton
        playAgainButton.tap()
        
        for _ in 0...15{
            spinButton.tap()
        }
        playAgainButton.tap()
        for _ in 0...15{
            spinButton.tap()
        }
        playAgainButton.tap()
        
        let resetButton = slotViewPage.resetButton
        resetButton.tap()
        XCTAssertEqual("0", slotViewPage.score.label)
    }
    
}

