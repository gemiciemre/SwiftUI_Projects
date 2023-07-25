//
//  GalleryView.swift
//  Africa
//
//  Created by Emre Gemici on 19.07.2023.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            Text("Gallery View")
        }//:SCROLL
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
