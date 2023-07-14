//
//  FruitModel.swift
//  Fruits
//
//  Created by Emre Gemici on 13.07.2023.
//

import SwiftUI

// MARK : - FRUITS DATA MODEL
 
struct Fruit : Identifiable {
    var id = UUID()
    var title : String
    var headline : String
    var image : String
    var gradientColors : [Color]
    var description : String
    var nutrition : [String]
}
