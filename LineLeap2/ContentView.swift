//
//  ContentView.swift
//  LineLeap2
//
//  Created by Matej Popovski on 4/5/24.
//

//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}
//
//#Preview {
//    ContentView()
//}

import SwiftUI

struct ContentView: View {
    @State private var xOffset: CGFloat = 0
    @State private var dragOffset: CGSize = .zero
    
    // Define navy dark blue color
    let navyDarkBlue = Color(red: 0.1, green: 0.16, blue: 0.3)
    
    var body: some View {
        ZStack {
            // Apply navy dark blue background color to the whole screen
            navyDarkBlue.edgesIgnoringSafeArea(.all)
            
            VStack {
                ZStack {
                    Text("My Passes")
                    RoundedRectangle(cornerRadius: 25) // Adjust cornerRadius as desired
                        .fill(Color.blue)
                        .frame(width: 330, height: 275) // Adjust size as desired
                        .offset(x: xOffset + dragOffset.width, y: 0) // Restricting vertical movement to 0
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    dragOffset = CGSize(width: value.translation.width, height: 0)
                                }
                                .onEnded { value in
                                    xOffset += value.translation.width
                                    dragOffset = .zero
                                }
                        )
                    
                    Button(action: {
                        // Action to perform when the button is clicked
                        print("Button clicked!")
                    }) {
                        Text("Click Me!")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                            .offset(x: xOffset + dragOffset.width, y: 0) // Restricting vertical movement to 0
                    }
                    .padding()
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
