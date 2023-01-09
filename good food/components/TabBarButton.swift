//
//  TabBarButton.swift
//  good food
//
//  Created by Zeynia Wax on 2023/01/06.
//

import SwiftUI

struct TabBarButton: View {
    
    var buttonText: String
    var imageName: String
    var isActive: Bool
    var body: some View {
        
        GeometryReader {geo in
            if isActive {
                Rectangle()
                    .foregroundColor(.pink)
                    .frame(width: geo.size.width/2, height:4)
                    .padding(.leading,geo.size.width/4)
            }
            VStack( alignment: .center, spacing: 4){
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width:34,height: 34)
                Text(buttonText)
                    .font(.footnote)
                
                
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct TabBarButton_Previews: PreviewProvider {
    static var previews: some View {
        TabBarButton(buttonText: "favoriteMeal", imageName: "favoriteSaved", isActive: true)
    }
}
