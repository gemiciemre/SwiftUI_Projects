//
//  Note.swift
//  Notes Watch App
//
//  Created by Emre Gemici on 17.08.2023.
//

import Foundation

struct Note: Identifiable, Codable{
    let id: UUID
    let text: String
}
