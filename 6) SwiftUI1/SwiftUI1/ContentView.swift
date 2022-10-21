//
//  ContentView.swift
//  SwiftUI1
//
//  Created by profesor on 19/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Spacer()
            HStack(alignment: .center, spacing: 10, content: {
                Spacer()
                Button(action:{}, label:{
                    Image("lemon")
                })
                Spacer()
                Button(action:{}, label:{
                    Image("donut")
                })
                Spacer()
                Button(action:{}, label:{
                    Image("lemon")
                })
                Spacer()
            })
            Spacer()
            HStack(alignment: .center, spacing: 10, content: {
                Spacer()
                Button(action:{}, label:{
                    Image("apple")
                })
                Spacer()
                Button(action:{}, label:{
                    Image("apple")
                })
                Spacer()
                Button(action:{}, label:{
                    Image("apple")
                })
                Spacer()
            })
            Spacer()
            HStack(alignment: .center, spacing: 10, content: {
                Spacer()
                Button(action:{}, label:{
                    Image("lemon")
                })
                Spacer()
                Button(action:{}, label:{
                    Image("lemon")
                })
                Spacer()
                Button(action:{}, label:{
                    Image("lemon")
                })
                Spacer()
            })
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
