//
//  Missions.swift
//  NCX
//
//  Created by Giuseppe Rocco on 22/03/23.
//

import SwiftUI

let rovers: [Rover] = [
    Rover(name: "Perseverance", mission: "Mars 2020", imgSrc: "https://mars.nasa.gov/layout/mars2020/images/LearnAboutTheRover_Perseverance_QuickFacts.png"),
    Rover(name: "Curiosity", mission: "MSL", imgSrc: "https://mars.nasa.gov/system/feature_items/images/6037_msl_banner.jpg")
]

struct Missions: View {
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(.vertical) {
                    ForEach(rovers, id: \.self) { rover in
                        NavigationLink(destination: Grid(name: rover.name)) {
                            
                        Element(imageSource: rover.imgSrc)
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

struct Missions_Previews: PreviewProvider {
    static var previews: some View {
        Missions()
    }
}
