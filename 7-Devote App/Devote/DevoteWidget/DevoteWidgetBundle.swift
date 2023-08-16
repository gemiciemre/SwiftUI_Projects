//
//  DevoteWidgetBundle.swift
//  DevoteWidget
//
//  Created by Emre Gemici on 16.08.2023.
//

import WidgetKit
import SwiftUI

@main
struct DevoteWidgetBundle: WidgetBundle {
    var body: some Widget {
        DevoteWidget()
        DevoteWidgetLiveActivity()
    }
}
