//
//  ThemeSettings.swift
//  Todo App
//
//  Created by Emre Gemici on 24.09.2023.
//

import SwiftUI

// MARK: - THEME SETTINGS

final public class ThemeSettings: ObservableObject {
  @Published public var themeSettings: Int = UserDefaults.standard.integer(forKey: "Theme") {
    didSet {
      UserDefaults.standard.set(self.themeSettings, forKey: "Theme")
    }
  }
  
  public init() {}
  public static let shared = ThemeSettings()
}
