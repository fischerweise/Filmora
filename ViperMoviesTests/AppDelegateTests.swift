//
//  MovieTests.swift
//  FilmoraTests
//
//  Created by Mustafa Pekdemir on 2.05.2022.
//

import XCTest
import UIKit
@testable import ViperMovies

class AppDelegateTests: XCTestCase {

    var appDelegate = AppDelegate()
    var window: UIWindow? = UIWindow()
    
    override func setUp() {
        super.setUp()
        appDelegate.window = window
    }

    override func tearDown() {
        super.tearDown()
        window = nil
    }
    
    
    func testThatDidFinishLaunchingWithOptionsReturnsTrue() {
        XCTAssertTrue(appDelegate.application(UIApplication.shared, didFinishLaunchingWithOptions: nil))
    }
    
}
