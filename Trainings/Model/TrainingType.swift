//
//  TrainingType.swift
//  Trainings
//
//  Created by Sergey Kemenov on 14.04.2024.
//

import Foundation

enum TrainingType: Int, CaseIterable {
    case intervals = 0
    case easyRun
    case tempoRun
    case longRun
    case strength

    var value: String {
        switch self {
        case .intervals: return String(localized: "Intervals")
        case .easyRun: return String(localized: "Easy run")
        case .tempoRun: return String(localized: "Tempo run")
        case .longRun: return String(localized: "Longrun")
        case .strength: return String(localized: "Strength training")
        }
    }

    var iconName: String {
        switch self {
        case .intervals: return "intervals"
        case .easyRun: return "easyRun"
        case .tempoRun: return "tempoRun"
        case .longRun: return "longRun"
        case .strength: return "strength"
        }
    }
}
