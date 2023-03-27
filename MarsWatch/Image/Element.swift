//
//  Element.swift
//  NCX
//
//  Created by Giuseppe Rocco on 22/03/23.
//

import SwiftUI

struct Element: View {
    let imageSource: String
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: imageSource)) { phase in
                switch phase {
                case .empty:
                    Spacer()
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.accentColor))
                    
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                case .failure(_):
                    Spacer()
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(.red)
                    Spacer()
                    
                @unknown default:
                    EmptyView()
                }
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct Element_Previews: PreviewProvider {
    static var previews: some View {
        Element(imageSource: "https://example.com")
    }
}
