//
//  CardModel.swift
//  Learn by Doing
//
//  Created by Emre Gemici on 28.08.2023.
//

import SwiftUI

// MARK: - CARD MODEL

struct Card: Identifiable{
    var id = UUID()
    var title : String
    var headline : String
    var imageName : String
    var callToAction : String
    var message : String
    var gradientColors: [Color]
}
