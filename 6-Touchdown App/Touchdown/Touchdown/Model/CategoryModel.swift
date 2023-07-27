//
//  CategoryModel.swift
//  Touchdown
//
//  Created by Emre Gemici on 27.07.2023.
//

import Foundation

struct Category : Codable, Identifiable{
    let id: Int
    let name: String
    let image: String
}
