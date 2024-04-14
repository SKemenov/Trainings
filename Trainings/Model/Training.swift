//
//  Training.swift
//  Trainings
//
//  Created by Sergey Kemenov on 14.04.2024.
//

import Foundation

struct Training: Hashable, Identifiable {
    var id = UUID()
    var type: TrainingType
    var duration: String
    var plan: String
    var date: Date
}
