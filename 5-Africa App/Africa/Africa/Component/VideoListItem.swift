//
//  VideoListItem.swift
//  Africa
//
//  Created by Emre Gemici on 21.07.2023.
//

import SwiftUI

struct VideoListItem: View {
    // MARK: - PROPERTIES
    
    let video : Video
    
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image("video-\(video.id)")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .cornerRadius(9)
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                
            }
        }//: HSTACK
    }
}
    // MARK: - PREVIEW
struct VideoListItem_Previews: PreviewProvider {
    
    static let videos : [Video] = Bundle.main.decode("videos.json")
    
    static var previews: some View {
        VideoListItem(video: videos[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
