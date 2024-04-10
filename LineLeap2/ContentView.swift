//
//  ContentView.swift
//  LineLeap2
//
//  Created by Matej Popovski on 4/5/24.
//

import SwiftUI

struct ContentView: View {
    @State private var xOffset: CGFloat = 0
    @State private var dragOffset: CGSize = .zero
    
    var body: some View {
            ZStack {
            // Background photo
            Image("background") // Replace "background_photo" with the name of your background photo asset
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
             
                ZStack {
                    Image("latezt") // Replace "your_photo" with the name of your photo asset
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 330, height: 275) // Adjust size as desired
                        .clipped()
                        .cornerRadius(12) // Apply a corner radius to smooth the corners
                        .offset(x: xOffset + dragOffset.width, y: -175) // Move the photo up by 175 points
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    dragOffset = CGSize(width: value.translation.width, height: 0)
                                }
                                .onEnded { value in
                                    xOffset += value.translation.width
                                    dragOffset = .zero
                                    
                                    // Animate the photo back to its original position
                                    withAnimation {
                                        xOffset = 0
                                    }
                                }
                        )
                    Button(action: {
                        
                    }, label: {
                        Text("      I am the bartender or venue staff               ")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .padding()
                            .padding(.vertical, 13)
                            .padding(.leading, -15)
                            .background(
//                                Capsule()
//                                    .stroke(Color.white, lineWidth: 2.0))
                                Color.gray
                                    .cornerRadius(8)
                                    .shadow(radius: 10))
                                
                    })
                    //.frame(width: 400)
                    .offset(x: 0, y: 192)
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//TEST2
