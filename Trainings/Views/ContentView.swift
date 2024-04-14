//
//  ContentView.swift
//  Trainings
//
//  Created by Sergey Kemenov on 10.04.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text("Training plan")
                .font(Font.hTitle)
            HStack {
                Text("January 2024").font(Font.hHeading)
                Spacer()
                Image(.calendar1)
            }
            Spacer()
        }
        .padding(.leading, 24)
        .padding(.trailing, 20)
        .padding(.top, 32)
    }
}

#Preview {
    ContentView()
}


extension Font {
    static let hTitle = Font.custom("SharpGroteskPETrialBook", size: 24)
    static let hHeading = Font.custom("SharpGroteskPETrialBook", size: 16)
    static let hBody = Font.custom("SharpGroteskPETrialBook", size: 14)
    static let hDescription = Font.custom("SharpGroteskPETrialBook", size: 11)

}
