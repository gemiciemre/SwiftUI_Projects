//
//  RipeningStagesView.swift
//  Avocados
//
//  Created by Emre Gemici on 1.09.2023.
//

import SwiftUI

struct RipeningStagesView: View {
    
    var ripeningStages: [Ripening] = ripeningsData
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            VStack{
                HStack(alignment: .center,spacing: 25){
                    ForEach(ripeningStages){item in
                       RipeningView(ripening: item)
                    }
                }
                .padding(.vertical)
                .padding(.horizontal,25)
                Spacer()
            }
        }
    }
}

struct RipeningStagesView_Previews: PreviewProvider {
    static var previews: some View {
        RipeningStagesView(ripeningStages: ripeningsData)
    }
}
