//
//  GeciciView.swift
//  Restart
//
//  Created by Emre Gemici on 5.07.2023.
//

import SwiftUI

struct GeciciView: View {
    
    @State private var downloadProgress: Double = 0.0

        var body: some View {
            VStack {
                Text("Download Progress: \(Int(downloadProgress * 100))%")
                    .padding()

                Button("Start Download") {
                    startDownload()
                }
            }
        }

        func startDownload() {
            DispatchQueue.global(qos: .background).async {
                for progress in stride(from: 0.0, through: 1.0, by: 0.1) {
                    DispatchQueue.main.async {
                        downloadProgress = progress
                    }

                    Thread.sleep(forTimeInterval: 1.0)
                }

                DispatchQueue.main.async {
                    downloadProgress = 0.0
                }
            }
        }
}

struct GeciciView_Previews: PreviewProvider {
    static var previews: some View {
        GeciciView()
    }
}
