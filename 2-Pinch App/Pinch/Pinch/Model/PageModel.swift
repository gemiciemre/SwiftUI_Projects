//
//  PageModel.swift
//  Pinch
//
//  Created by Emre Gemici on 6.07.2023.
//

import Foundation


struct Page: Identifiable {
    let  id: Int
    let imageName: String
}

extension Page {
    var thumbnaiName : String{
        return "thumb-" + imageName
    }
}
