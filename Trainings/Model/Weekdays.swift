//
//  Weekdays.swift
//  Trainings
//
//  Created by Sergey Kemenov on 11.04.2024.
//

import Foundation

enum Weekdays: Int, CaseIterable {
    case mon = 0
    case tue
    case wed
    case thu
    case fri
    case sat
    case sun

    var value: String {
        switch self {
        case .mon: return String(localized: "Mon")
        case .tue: return String(localized: "Tue")
        case .wed: return String(localized: "Wed")
        case .thu: return String(localized: "Thu")
        case .fri: return String(localized: "Fri")
        case .sat: return String(localized: "Sat")
        case .sun: return String(localized: "Sun")
        }
    }
}
