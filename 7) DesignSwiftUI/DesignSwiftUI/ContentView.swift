//
//  ContentView.swift
//  DesignSwiftUI
//
//  Created by profesor on 21/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            Header()
            
            Search()
                .padding(.top, 10)
            
            Buttons()
                .padding(.vertical, 20)
            
            Cards()
                .padding(.top, 20)
            
            Footer()
                .offset(y: 03)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//MARK: Header

struct Header: View{
    var body: some View{
        HStack{
            VStack(alignment: .leading){
                Text("Good morning")
                    .font(.system(size: 19, weight: .medium, design: .serif))
                    .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                    .padding(.top, 40)
                
                Text("User")
                    .font(.system(size: 28, weight: .medium, design: .serif))
                    .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                    .padding(.top, 5)
            }
            .padding(.leading, 30)
            Spacer()
            Image("loggeduser")
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.trailing, 30)
        }
    }
}

//MARK: Search

struct Search: View{
    @State var searchCriteria: String = ""
    var body: some View{
        HStack{
            TextField("Search for tech and other things", text: $searchCriteria)
                .foregroundColor(.gray)
                .font(.system(size: 15))
                .padding(.leading, 20)
            
            Spacer()
            Image(systemName: "magnifyingglass")
                .font(.system(size: 26, weight: .medium, design: .serif))
                .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                .padding(.trailing, 20)
        }
        .frame(width: 350, height: 54)
        .background(Color.white)
        .cornerRadius(14)
    }
}

//MARK: Buttons

struct Buttons: View{
    
    var body: some View{
        VStack{
            HStack(spacing: 35){
                VStack{
                    ZStack{
                       Image(systemName: "clock")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                    }
                    .frame(width: 60, height: 60)
                    .background(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                    .cornerRadius(10)
                    
                    Text("Time")
                        .font(.system(size: 12, weight: .bold, design: .serif))
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                }
                
                VStack{
                    ZStack{
                       Image(systemName: "flame")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                    }
                    .frame(width: 60, height: 60)
                    .background(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                    .cornerRadius(10)
                    
                    Text("Recent")
                        .font(.system(size: 12, weight: .bold, design: .serif))
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                }
                
                VStack{
                    ZStack{
                       Image(systemName: "diamond")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                    }
                    .frame(width: 60, height: 60)
                    .background(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                    .cornerRadius(10)
                    
                    Text("Favorites")
                        .font(.system(size: 12, weight: .bold, design: .serif))
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                }
            }
        }
    }
}

//MARK: Cards

struct Cards: View{
    var body: some View{
        VStack(alignment: .leading){
            Text("Featured items")
                .font(.system(size: 22, weight: .bold, design: .serif))
                .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
            
            ScrollView(.horizontal){
                HStack(spacing: 40){
                    VStack{
                        Image("bluecosmic")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        VStack(alignment: .leading){
                            Text("Cosmic articles")
                                .font(.system(size: 20, weight: .bold, design: .serif))
                                .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                                .padding(.horizontal, 10)
                            
                            Text("Read the most important papers")
                                .font(.system(size: 15, weight: .bold, design: .serif))
                                .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                                .lineLimit(3)
                                .padding(.top, 5)
                                .padding(.leading, 10)
                                .padding(.bottom, 15)
                        }
                        .frame(height: 100)
                    }
                    .frame(width: 280, height: 340)
                    .background(Color.white)
                    .cornerRadius(30)
                    
                    VStack{
                        Image("bluesphere")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        VStack(alignment: .leading){
                            Text("3D Shapes")
                                .font(.system(size: 20, weight: .bold, design: .serif))
                                .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                                .padding(.horizontal, 10)
                            
                            Text("Design of shapes")
                                .font(.system(size: 15, weight: .bold, design: .serif))
                                .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                                .lineLimit(3)
                                .padding(.top, 5)
                                .padding(.leading, 10)
                                .padding(.bottom, 15)
                        }
                        .frame(height: 100)
                    }
                    .frame(width: 280, height: 340)
                    .background(Color.white)
                    .cornerRadius(30)
                    
                    VStack{
                        Image("bluecosmic")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        VStack(alignment: .leading){
                            Text("Cosmic articles")
                                .font(.system(size: 20, weight: .bold, design: .serif))
                                .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                                .padding(.horizontal, 10)
                            
                            Text("Read the most important papers")
                                .font(.system(size: 15, weight: .bold, design: .serif))
                                .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                                .lineLimit(3)
                                .padding(.top, 5)
                                .padding(.leading, 10)
                                .padding(.bottom, 15)
                        }
                        .frame(height: 100)
                    }
                    .frame(width: 280, height: 340)
                    .background(Color.white)
                    .cornerRadius(30)
                }
            }
            .padding(.top, 12)
        }
        .padding(.leading, 30)
        .padding(.top, 10)
    }
}

//MARK: Footer

struct Footer: View{
    var body: some View{
        HStack(spacing: 60){
            VStack{
                Image(systemName: "house")
                    .font(.system(size: 26))
                    .foregroundColor(.white)
                Circle()
                    .frame(width: 6, height: 6)
                    .foregroundColor(.white)
                    .opacity(0)
            }
            
            VStack{
                Image(systemName: "heart")
                    .font(.system(size: 26))
                    .foregroundColor(.white)
                Circle()
                    .frame(width: 6, height: 6)
                    .foregroundColor(.white)
                    .opacity(0)
            }
            
            VStack{
                Image(systemName: "cube")
                    .font(.system(size: 26))
                    .foregroundColor(.white)
                Circle()
                    .frame(width: 6, height: 6)
                    .foregroundColor(.white)
                    .opacity(0)
            }
            
            VStack{
                Image(systemName: "person")
                    .font(.system(size: 26))
                    .foregroundColor(.white)
                Circle()
                    .frame(width: 6, height: 6)
                    .foregroundColor(.white)
                    .opacity(0)
            }
        }
        .frame(height: 84)
        .frame(maxWidth: .infinity)
        .background(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
        .cornerRadius(20)
    }
}

