//
//  ContentView.swift
//  Touchdown
//
//  Created by Emre Gemici on 26.07.2023.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    @EnvironmentObject var shop : Shop
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            if shop.showingProduct == false && shop.selectedProduct == nil {
                VStack(spacing: 0){
                    NavigationBarView()
                        .padding(.horizontal,15)
                        .padding(.bottom)
                        .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top) // it will change this line
                        .background(Color.white)
                        .shadow(color: Color.black.opacity(0.05), radius: 5,x: 0,y: 5)
                    
                    ScrollView(.vertical, showsIndicators: false, content:{
                        VStack(spacing: 0){
                            FeaturedTabView()
                                .padding(.vertical,10)
                                //.frame(height: UIScreen.main.bounds.width / 1.475) // This will fix the layout rendering priority issue by using the screen's aspect ratio. (Fix_1)
                                .frame(minHeight: 256) // (Fix_2)
                            
                            CategoryGridView()
                            
                            TitleView(title: "Helmets")
                            
                            LazyVGrid(columns: gridLayout, spacing: 15, content:{
                                ForEach(products){product in
                                    ProductItemView(product: product)
                                        .onTapGesture {
                                            feedback.impactOccurred()
                                            withAnimation(.easeOut){
                                                shop.selectedProduct = product
                                                shop.showingProduct = true
                                                
                                            }
                                        }
                                }//: LOOP
                            })//: GRID
                            .padding()
                            
                            TitleView(title: "Brands")
                            
                            BrandGridView()
                            
                            FooterView()
                                .padding(.horizontal)
                        }//: VSTACK
                    })//: SCROLL
                }//: VSTACK
                .background(colorBackground.ignoresSafeArea(.all,edges: .all))
            } else {
                ProductDetailView()
            }
        }//: ZSTACK
        .ignoresSafeArea(.all, edges: .top)
    }
}
    // MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Shop())
    }
}
