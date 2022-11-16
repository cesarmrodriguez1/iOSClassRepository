//
//  ContentView.swift
//  CameraTest
//
//  Created by profesor on 09/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSheet: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    
    @State private var image: UIImage?
    
    var body: some View {
        NavigationView{
            Image(uiImage: image ?? UIImage(systemName: "heart.fill")!)
                .resizable()
                .frame(width: 300, height: 300)
            
            Button("Choose picture"){
                self.showSheet = true
            }.padding()
                .actionSheet(isPresented: $showSheet){
                    ActionSheet(title: Text("Select photo"), message: Text("Choose"), buttons: [
                        .default(Text("Photo Library")){
                            self.showImagePicker = true
                            self.sourceType = .photoLibrary
                        },
                        .default(Text("Camera")){
                            self.showImagePicker = true
                            self.sourceType = .camera
                        },
                        .cancel()
                    ])
                }
                .navigationBarTitle("Camera use app")
        }.sheet(isPresented: $showImagePicker){
            ImagePicker(image: $image, isShown: self.$showImagePicker, sourceType: self.sourceType)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
