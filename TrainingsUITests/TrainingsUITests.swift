//
//  TrainingsUITests.swift
//  TrainingsUITests
//
//  Created by Sergey Kemenov on 14.04.2024.
//

import XCTest
import SwiftUI
@testable import Trainings

final class TrainingsUITests: XCTestCase {
    // swiftlint:disable:next implicitly_unwrapped_optional
    var app: XCUIApplication!

    override func setUpWithError() throws {
        try super.setUpWithError()

        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        app = nil
    }

    func testAppHasPlanTitles() throws {
        XCTAssertTrue(app.staticTexts["PlanTitle"].exists)
        XCTAssertTrue(app.staticTexts["PlanActivitiesHeader"].exists)
        XCTAssertTrue(app.staticTexts["PlanMonthHeader"].exists)
    }

    func testAppHasTabs() throws {
        XCTAssertTrue(app.buttons["HomeTab"].exists)
        XCTAssertTrue(app.buttons["PlanTab"].exists)
        XCTAssertTrue(app.buttons["CoachTab"].exists)
        XCTAssertTrue(app.buttons["ProfileTab"].exists)
    }
}
