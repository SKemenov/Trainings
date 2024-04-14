//
//  MockViewModel.swift
//  Trainings
//
//  Created by Sergey Kemenov on 11.04.2024.
//

import SwiftUI

class MockViewModel: ObservableObject {
    @Published var trainings: [Training]
    @Published var firstDay: Date
    @Published var lastDay: Date
    @Published var selectionOfWeek: [Bool]
    @Published var selectedDate: Date
    var currentWeekMonday: Date {
        selectedDate.theSameWeekMonday
    }
    var currentWeekSunday: Date {
        selectedDate.theSameWeekMonday.addingTimeInterval(.fullOneWeekDuration)
    }
    var currentTrainingsPlan: [Training] {
        if let weekDayIndex = selectionOfWeek.firstIndex(of: true) {
            return trainings.filter {
                $0.date == currentWeekMonday.addingTimeInterval(.oneDayDuration * Double(weekDayIndex))
            }
        } else {
            return trainings.filter {
                $0.date >= currentWeekMonday && $0.date <= currentWeekSunday
            }
        }
    }

    init() {
        let trainings = [
            Training(type: .intervals, duration: "8km", plan: "200/400 rest", date: Date("2024-04-08")),
            Training(type: .easyRun, duration: "10km", plan: "HR zone 2", date: Date("2024-04-10")),
            Training(type: .tempoRun, duration: "6km", plan: "HR zone 3-4", date: Date("2024-04-12")),
            Training(type: .longRun, duration: "17km", plan: "65%", date: Date("2024-04-13")),
            Training(type: .strength, duration: "1 hour", plan: "dumbbells, free weight", date: Date("2024-04-15")),
            Training(type: .intervals, duration: "8km", plan: "200/400 rest", date: Date("2024-04-17")),
            Training(type: .easyRun, duration: "10km", plan: "HR zone 2", date: Date("2024-04-07")),
            Training(type: .tempoRun, duration: "6km", plan: "HR zone 3-4", date: Date("2024-04-21")),
            Training(type: .longRun, duration: "17km", plan: "65%", date: Date("2024-04-19")),
            Training(type: .strength, duration: "1 hour", plan: "dumbbells, free weight", date: Date("2024-04-01")),
            Training(type: .strength, duration: "1 hour", plan: "dumbbells, free weight", date: Date("2024-04-03")),
            Training(type: .strength, duration: "1 hour", plan: "dumbbells, free weight", date: Date("2024-04-05"))
        ]
        self.trainings = trainings.sorted { $0.date < $1.date }

        self.selectionOfWeek = Array(repeating: false, count: 7)

        self.firstDay = Date.now.theSameWeekMonday.addingTimeInterval(-.oneWeekDuration)
        self.lastDay = Date.now.theSameWeekMonday.addingTimeInterval(.fullTwoWeeksDuration)
        self.selectedDate = Date.now
    }

    func selectPreviousWeek() {
        if currentWeekMonday > firstDay {
            selectedDate = selectedDate.addingTimeInterval(-.oneWeekDuration)
        }
    }

    func selectNextWeek() {
        if currentWeekSunday < lastDay {
            selectedDate = selectedDate.addingTimeInterval(.oneWeekDuration)
        }
    }
}
