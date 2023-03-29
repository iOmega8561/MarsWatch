//
//  Grid.swift
//  NCX
//
//  Created by Giuseppe Rocco on 22/03/23.
//

import SwiftUI

struct LatestPictures: View {
    let name: String
    private let nasaAPI: NasaAPI = NasaAPI()
    @State private var photos: [Photo] = []
    
    private let gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        
            NavigationStack {
                GeometryReader { proxy in
                VStack {
                    if !photos.isEmpty {
                        ScrollView {
                            LazyVGrid(columns: gridItemLayout, spacing: 10) {
                                ForEach(photos) { photo in
                                    NavigationLink(destination: PictureDetails(photo: photo)) {
                                        ZStack {
                                            
                                            RoundedRectangle(cornerRadius: 8)
                                                .fill(Color.black)
                                            
                                            RemoteImage(imageSource: photo.imageSource)
                                                .scaledToFit()
                                            
                                        }
                                        .frame(width: 115, height: 115)
                                    }.isDetailLink(true)
                                }
                            }.frame(maxWidth: proxy.size.width)
                        }
                    } else {
                        Spacer()
                        HStack {
                            Spacer()
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: Color.accentColor))
                            Spacer()
                        }
                        Spacer()
                    }
                }
                .padding()
                .navigationTitle("Latest Pictures")
                .task {
                    do {
                        photos = try await nasaAPI.latestPhotos(rover: name)
                    } catch {
                        print("Error fetching photos: \(String(describing: error))")
                    }
                }
            }
        }
    }
}

struct LatestImages_Previews: PreviewProvider {
    static var previews: some View {
        LatestPictures(name: "Curiosity")
    }
}
