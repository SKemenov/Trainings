//
//  WeekdaysView.swift
//  Trainings
//
//  Created by Sergey Kemenov on 11.04.2024.
//

import SwiftUI

struct WeekView: View {
    @ObservedObject var viewModel: MockViewModel

    var body: some View {
        HStack(spacing: 0) {
            ForEach(Weekdays.allCases, id: \.self) { weekday in
                let duration = .oneDayDuration * Double(weekday.rawValue)
                let thisDay = viewModel.currentWeekMonday.addingTimeInterval(duration)
                WeekDayView(
                    day: thisDay,
                    isEmpty: viewModel.trainings.filter { $0.date.sameDay(thisDay) }.isEmpty,
                    isSelected: viewModel.selectionOfWeek[weekday.rawValue]
                )
                .onTapGesture {
                    var newState = Array(repeating: false, count: 7)
                    newState[weekday.rawValue] = true
                    viewModel.selectionOfWeek = (viewModel.selectionOfWeek == newState)
                    ? Array(repeating: false, count: 7)
                    : newState
                }
            }
        }
    }

    init(viewModel: MockViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    WeekView(viewModel: MockViewModel())
}
