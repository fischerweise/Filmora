//
//  FilmoraUITests.swift
//  FilmoraUITests
//
//  Created by Mustafa Pekdemir on 5.05.2022.
//

import XCTest

class FilmoraUITests: XCTestCase {

    func test_Filmora_uitests() {
        let app = XCUIApplication()
        app.launch()
        let tablesQuery = app.tables
        tablesQuery.cells.containing(.staticText, identifier: "The Batman").element.tap()
        tablesQuery.staticTexts["Add to Watchlist"].tap()
        app.alerts["Success"].scrollViews.otherElements.buttons["OK"].tap()
        //MARK- Hocam klavyeyi simulatordan açınız.
        app.navigationBars["Movie Detail"].buttons["Movies"].tap()
        XCUIApplication().navigationBars["Movies"].searchFields["Type a movie here to search"].tap()
        let gKey = app.keys["G"].tap()
        let oKey = app.keys["o"].tap()
        let dKey = app.keys["d"].tap()
        let fKey = app.keys["f"].tap()
        app.tables.staticTexts["The Godfather"].tap()
    }
}
