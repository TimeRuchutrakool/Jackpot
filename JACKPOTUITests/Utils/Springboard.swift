//
//  Springboard.swift
//  JACKPOTUITests
//
//  Created by Time Ruchutrakool on 3/27/23.
//

import Foundation
import XCTest

class Springboard{
    static let springBoard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
    
    class func deleteApp(){
        XCUIApplication().terminate()
        springBoard.activate()
        
        let appIcon = springBoard.icons.matching(identifier: "Jackpot").firstMatch
        appIcon.press(forDuration: 1.3)
        
        let _ = springBoard.alerts.buttons["Remove App"].firstMatch
        springBoard.buttons["Remove App"].tap()
        
        let deleteButton = springBoard.alerts.buttons["Delete App"].firstMatch
        if deleteButton.waitForExistence(timeout: 5){
            deleteButton.tap()
            springBoard.alerts.buttons["Delete"].tap()
        }
    }
}
