//
//  TrainingROwView.swift
//  Trainings
//
//  Created by Sergey Kemenov on 12.04.2024.
//

import SwiftUI

struct TrainingRowView: View {
    var training: Training

    var body: some View {
        ZStack {
            HStack(spacing: 20) {
                Image("\(training.type.iconName)")
                    .foregroundStyle(training.type == .intervals ? .primary : Color.hLightGray)

                VStack(alignment: .leading) {
                    Text(training.type.value)
                        .font(.hBody)
                        .frame(height: 20)

                    HStack(spacing: 13) {
                        Text(training.duration)
                        Text(training.plan)
                    }
                    .font(.hBody)
                    .foregroundStyle(Color.hLightGray)
                    .frame(height: 20)
                }

                Spacer()

                VStack(spacing: 8) {
                    Text("\(training.date.getDay)")
                        .font(.hBody)
                        .frame(width: 32, height: 20)

                    Text(Weekdays(rawValue: training.date.getWeekDay)?.value.uppercased() ?? "")
                        .frame(width: 32, height: 20)
                        .foregroundStyle(Color.hLightGray)
                        .font(.hDescription)
                }
            }
        }
    }

    init(training: Training) {
        self.training = training
    }
}

#Preview {
    TrainingRowView(
        training: Training(type: .intervals, duration: "8km", plan: "Run Forest, run!!!", date: Date.now))
}
