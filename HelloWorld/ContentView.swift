//
//  ContentView.swift
//  HelloWorld
//
//  Created by IOTA INFOTECH LIMITED on 3/12/23.
//

import SwiftUI

extension Image {
    func imageModifier()-> some View{
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View{
        self
            .imageModifier()
            .frame(maxWidth: 128)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            // MARK: -1 BASIC
            //AsyncImage(url: URL(string: "https://images.pexels.com/photos/934011/pexels-photo-934011.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"))
            
            //MARK: - 2 SCALE
            //AsyncImage(url: URL(string: "https://images.pexels.com/photos/934011/pexels-photo-934011.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"), scale: 2.0)
            
            // MARK: - 3 PLACWHOLDER
            /*AsyncImage(url: URL(string: "https://images.pexels.com/photos/934011/pexels-photo-934011.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")){ image in
                image.imageModifier()
                    
                } placeholder: {
                Image(systemName: "photo.circle.fill")
                    .iconModifier()
                    
            }.padding(40)*/
            
            // MARK: - 4 PHASE
            
            /*AsyncImage(url: URL(string: "https://images.pexels.com/photos/934011/pexels-photo-934011.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")){ phase in
                // SUCCESS: The image successfully loaded
                // FAILURE: The image failed to load with an error
                // EMPTY: No image is loaded
                if let image = phase.image {
                    image.imageModifier()
                } else if phase.error != nil {
                    Image(systemName: "ant.circle.fill").iconModifier()
                } else{
                    Image(systemName: "photo.circle.fill").iconModifier()
                }
            }
            .padding(40)*/
            
            // MARK: - 5 ANIMATION
            
            AsyncImage(url: URL(string: "https://images.pexels.com/photos/934011/pexels-photo-934011.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))){ phase in
                // SUCCESS: The image successfully loaded
                // FAILURE: The image failed to load with an error
                // EMPTY: No image is loaded
                
                switch phase{
                case .success(let image):
                    image
                        .imageModifier()
                        //.transition(.move(edge: .bottom))
                        //.transition(.slide)
                        .transition(.scale)
                case .failure(_):
                    Image(systemName: "ant.circle.fill").iconModifier()
                case .empty:
                    Image(systemName: "photo.circle.fill").iconModifier()
                @unknown default:
                    ProgressView()
                }
            }
            .padding(40)
            
            
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
