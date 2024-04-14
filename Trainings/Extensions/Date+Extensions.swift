//
//  Date+Extensions.swift
//  Trainings
//
//  Created by Sergey Kemenov on 14.04.2024.
//

import Foundation

extension Date {
    var theSameWeekMonday: Date {
        Calendar.iso8601.dateComponents([.calendar, .yearForWeekOfYear, .weekOfYear], from: self).date ?? self
    }

    var getDay: Int {
        Calendar.iso8601.dateComponents([.day], from: self).day ?? 0
    }

    var getWeekDay: Int {
        guard let weekDay = Calendar.iso8601.dateComponents([.weekday], from: self).weekday else { return 0 }
        return weekDay == 1 ? 6 : weekDay - 2
    }

    var fullMonthYear: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: self)
    }

    init(_ dateString: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.date(from: dateString) ?? Date.now
        self.init(timeInterval: 0, since: date)
    }

    func sameDay(_ date: Date) -> Bool {
        Calendar.current.compare(self, to: date, toGranularity: .day) == .orderedSame
    }
}
