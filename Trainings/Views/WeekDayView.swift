//
//  WeekDayView.swift
//  Trainings
//
//  Created by Sergey Kemenov on 11.04.2024.
//

import SwiftUI

struct WeekDayView: View {
    var day: Date
    var isEmpty: Bool
    var isSelected: Bool

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 26)
                .strokeBorder(isSelected ? Color.hLightGray : .clear, lineWidth: 2)
                .frame(width: 52, height: 80)
            RoundedRectangle(cornerRadius: 22)
                .foregroundColor(isEmpty ? .hDarkGray : .hAccent)
                .frame(width: 44, height: 72)
            VStack(spacing: 8) {
                Text(Weekdays(rawValue: day.getWeekDay)?.value.uppercased() ?? "")
                    .frame(width: 32, height: 20)
                    .font(.hDescription)
                    .foregroundStyle(Color.hLightGray)

                Text("\(day.getDay)")
                    .frame(width: 32, height: 20)
                    .font(.hBody)
                    .foregroundStyle(.primary)
            }
        }
    }

    init(day: Date, isEmpty: Bool = true, isSelected: Bool = false) {
        self.day = day
        self.isEmpty = isEmpty
        self.isSelected = isSelected
    }
}

#Preview {
    WeekDayView(day: Date.now, isEmpty: false, isSelected: true)
}
