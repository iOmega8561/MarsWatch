//
//  Details.swift
//  NCX
//
//  Created by Giuseppe Rocco on 22/03/23.
//

import SwiftUI

struct DetailedView: View {
    let photo: Photo
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                RemoteImage(imageSource: photo.imageSource)
                
                Spacer()
                
                Rectangle()

                    .overlay(
                        VStack(alignment: .leading) {
                            Text("Sol: \(photo.sol)")
                                .foregroundColor(.white)
                            
                            Text("Camera: \(photo.camera.fullName) (\(photo.camera.name))")
                                .foregroundColor(.white)
                            
                            Text("Rover: \(photo.rover.name)")
                                .foregroundColor(.white)
                            
                            Text("Launch: \(photo.rover.launchDate)")
                                .foregroundColor(.white)
                            
                            Text("Landing: \(photo.rover.landingDate)")
                                .foregroundColor(.white)
                            
                            Text("Status: \(photo.rover.status)")
                                .foregroundColor(.white)
                        }
                    )
                    .frame(maxWidth: 400, maxHeight: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .padding()
            .navigationTitle("Details")
        }
    }
}

struct DetailedVIew_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(photo: Photo(
            id: 1,
            sol: 1,
            camera: Camera(name: "CMF", fullName: "Camera McLens Face"),
            imageSource: "https://example.com",
            earthDate: "2022-01-12",
            rover: PhotoRoverReference(
                id: 1,
                name: "Rovy",
                landingDate: "2019-01-01",
                launchDate: "2018-12-31",
                status: "active"
            )
        ))
    }
}
