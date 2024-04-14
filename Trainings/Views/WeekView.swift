//
//  WeekdaysView.swift
//  Trainings
//
//  Created by Sergey Kemenov on 11.04.2024.
//

import SwiftUI

struct WeekView: View {
    var isEmpty: Bool = false
    var isSelected: Bool = false
    var dateDay: String = "22"
    var dateName: String = "MON"
    
    var body: some View {
        HStack(spacing: 8) {
            ZStack {
                RoundedRectangle(cornerRadius: 22)
                    .foregroundColor(isEmpty ? .hDarkGray : .hAccent)
                .frame(width: 44, height: 72)
                VStack(spacing: 8) {
                    Text(dateName)
                        .font(.hDescription)
                        .foregroundStyle(.hLightGray)
                    Text(dateDay)
                        .font(.hBody)
                        .foregroundStyle(.white)
                }
            }

        }
    }
}

#Preview {
    WeekView()
}
