//
//  ContentView.swift
//  MapKitTest
//
//  Created by profesor on 11/11/22.
//

import SwiftUI

struct ContentView: View {
    @State private var directions : [String] = []
    @State private var showDirections = false
    
    var body: some View {
        VStack{
            MapView(directions: $directions)
            
            Button(action: {
                self.showDirections.toggle()
            }, label: {
                Text("Show directions")
            })
                .disabled(directions.isEmpty)
                .padding()
        }.sheet(isPresented: $showDirections, content: {
            VStack{
              Text("Directions")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                Divider().background(Color.blue)
                
                List(0..<self.directions.count, id: \.self){ i in
                    Text(self.directions[i]).padding()
                }
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
