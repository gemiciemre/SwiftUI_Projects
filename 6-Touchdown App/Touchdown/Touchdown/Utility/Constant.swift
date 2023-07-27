//
//  Constant.swift
//  Touchdown
//
//  Created by Emre Gemici on 26.07.2023.
//

import SwiftUI

// DATA
let players: [Player] = Bundle.main.decode("player.json")
let categories : [Category] = Bundle.main.decode("category.json")
let products : [Product] = Bundle.main.decode("product.json")
let brands : [Brand] = Bundle.main.decode("brand.json")
let sampleProduct : Product = products[0]

// COLOR
let colorBackground : Color = Color("ColorBackground")
let colorGray : Color = Color(UIColor.systemGray)

// LAYOUT
let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
    return Array(repeating: GridItem(.flexible(),spacing: rowSpacing), count: 2)
}

// UX
// API
// IMAGE
// FONT
// STRING
// MISC
