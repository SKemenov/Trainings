//
//  MockViewModelTests.swift
//  TrainingsTests
//
//  Created by Sergey Kemenov on 14.04.2024.
//

import XCTest
@testable import Trainings

final class MockViewModelTests: XCTestCase {
    func testSelectedDate() throws {
        let viewModel = MockViewModel()
        XCTAssertEqual(viewModel.selectedDate.sameDay(Date.now), true)
    }

    func testSelectNextWeek() throws {
        let viewModel = MockViewModel()
        viewModel.selectNextWeek()
        XCTAssertEqual(viewModel.selectedDate.sameDay(Date.now.addingTimeInterval(.oneWeekDuration)), true)
    }

    func testPreviousWeek() throws {
        let viewModel = MockViewModel()
        viewModel.selectPreviousWeek()
        XCTAssertEqual(viewModel.selectedDate.sameDay(Date.now.addingTimeInterval(-.oneWeekDuration)), true)
    }
}
