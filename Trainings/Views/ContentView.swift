//
//  ContentView.swift
//  Trainings
//
//  Created by Sergey Kemenov on 10.04.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 1

    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Home")
                .tag(0)
                .tabItem {
                    Label {
                        Text("Home")
                    } icon: {
                        Image(.home)
                    }
                    .accessibilityIdentifier("HomeTab")
                }

            TrainingPlanView()
                .tag(1)
                .tabItem {
                    Label {
                        Text("Plan")
                    } icon: {
                        Image(.calendar)
                    }
                    .accessibilityIdentifier("PlanTab")
                }

            Text("Coach")
                .tag(2)
                .tabItem {
                    Label {
                        Text("Coach")
                    } icon: {
                        Image(.coach)
                    }
                    .accessibilityIdentifier("CoachTab")
                }

            Text("Profile")
                .tag(3)
                .tabItem {
                    Label {
                        Text("Profile")
                    } icon: {
                        Image(.profile)
                    }
                    .accessibilityIdentifier("ProfileTab")
                }
        }
        .font(Font.hCaption)
        .tint(.hAccent)
    }
}

#Preview {
    ContentView()
}
