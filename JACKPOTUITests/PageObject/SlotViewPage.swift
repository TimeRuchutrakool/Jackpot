//
//  SlotViewPage.swift
//  JACKPOTUITests
//
//  Created by Time Ruchutrakool on 3/27/23.
//

import Foundation
import XCTest

class SlotViewPage{
    
    var app: XCUIApplication!
    
    init(app: XCUIApplication!) {
        self.app = app
    }
    
    var jackpotText: XCUIElement{
        app.staticTexts["jackpot"]
    }
    var spinButton: XCUIElement{
        app.images["spinButton"]
    }
    var playAgainButton: XCUIElement{
        app.buttons["playAgainButton"]
    }
    var gameOverText: XCUIElement{
        app.staticTexts["gameOver"]
    }
    var coinText: XCUIElement{
        app.staticTexts["coin"]
    }
    var bet30Coin: XCUIElement{
        app.staticTexts["bet30Coin"]
    }
    var bet20Coin: XCUIElement{
        app.staticTexts["bet20Coin"]
    }
    var resetButton: XCUIElement{
        app.buttons["resetButton"]
    }
    var score: XCUIElement{
        app.staticTexts["score"]
    }
}
