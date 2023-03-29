//
//  MainView.swift
//  NCX
//
//  Created by Giuseppe Rocco on 22/03/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(.vertical) {
                    ForEach(rovers, id: \.self) { rover in
                        NavigationLink(destination: LatestPictures(name: rover.name)) {
                            
                        RemoteImage(imageSource: rover.imgSrc)
                                .scaledToFill()
                                .frame(width: 350, height: 300)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .overlay(
                                    VStack {
                                        Spacer()
                                        
                                        RoundedRectangle(cornerRadius: 8)
                                            .foregroundColor(.black)
                                            .frame(height: 55)
                                            .overlay(
                                                Text("\(rover.mission) (\(rover.name))")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 27))
                                            )
                                    }
                                )
                                .shadow(radius: 7)
                            
                        }.isDetailLink(true)
                    }
                }.scrollIndicators(.hidden)
            }
            .padding()
            .navigationTitle("Mars Missions")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
