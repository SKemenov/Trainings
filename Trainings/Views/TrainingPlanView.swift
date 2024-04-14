//
//  TrainingPlanView.swift
//  Trainings
//
//  Created by Sergey Kemenov on 12.04.2024.
//

import SwiftUI

struct TrainingPlanView: View {
    @StateObject var viewModel = MockViewModel()
    @Environment(\.layoutDirection) var layoutDirection

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Training plan")
                .accessibilityLabel("PlanTitle")
                .font(Font.hTitle)
                .frame(width: 300, height: 24, alignment: .leading)
                .padding(.leading, 24)
                .padding(.trailing, 20)
                .padding(.top, 28)

            HStack {
                Text(viewModel.selectedDate.fullMonthYear).font(Font.hHeading)
                    .accessibilityIdentifier("PlanMonthHeader")
                Spacer()
                Image(.calendar1)
                    .overlay {
                        DatePicker(
                            "Select date",
                            selection: $viewModel.selectedDate,
                            in: viewModel.firstDay...viewModel.lastDay,
                            displayedComponents: .date
                        )
                        .opacity(.almostInvisibleButTouchable)
                    }
            }
            .frame(height: 20)
            .padding(.leading, 24)
            .padding(.trailing, 20)
            .padding(.top, 40)

            WeekView(viewModel: viewModel)
                .accessibilityIdentifier("PlanWeekDays")
                .frame(width: 364, height: 80, alignment: .center)
                .padding(.horizontal, 14)
                .padding(.top, 18)
                .gesture(DragGesture(minimumDistance: 30.0, coordinateSpace: .local)
                    .onEnded { value in
                        switch value.translation.width {
                        case ...0: layoutDirection == .leftToRight
                            ? viewModel.selectNextWeek()
                            : viewModel.selectPreviousWeek()
                        case 0...: layoutDirection == .leftToRight
                            ? viewModel.selectPreviousWeek()
                            : viewModel.selectNextWeek()
                        default: break
                        }
                    }
                )

            Text("Activities")
                .accessibilityLabel("PlanActivitiesHeader")
                .font(Font.hHeading)
                .frame(width: 200, height: 20, alignment: .leading)
                .padding(.leading, 24)
                .padding(.trailing, 20)
                .padding(.top, 36)
                .padding(.bottom, 20)

            if viewModel.currentTrainingsPlan.isEmpty {
                Text("It's a rest day")
                    .accessibilityIdentifier("PlanEmptyView")
                    .font(Font.hBody)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            } else {
                List {
                    ForEach(viewModel.currentTrainingsPlan, id: \.self) { training in
                        TrainingRowView(training: training)
                            .listRowSeparator(.hidden)
                            .frame(height: 48)
                    }
                }
                .accessibilityIdentifier("PlanActivitiesView")
                .listStyle(.inset)
                .listRowSpacing(22)
            }
        }
    }
}

#Preview {
    TrainingPlanView()
}
