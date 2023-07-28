//
//  Shop.swift
//  Touchdown
//
//  Created by Emre Gemici on 28.07.2023.
//

import Foundation

class Shop: ObservableObject {
    @Published var showingProduct: Bool = false
    @Published var selectedProduct: Product? = nil
}

