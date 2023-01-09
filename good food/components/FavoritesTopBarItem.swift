//
//  FavoritesTopBarItem.swift
//  good food
//
//  Created by Zeynia Wax on 2023/01/06.
//

import SwiftUI

struct FavoritesTopBarItem: View {
    var imageBarName: String
    var isSelected: Bool
    var body: some View {
        
        GeometryReader {geo in
            if isSelected{
                Circle()
                    .foregroundColor(.pink)
                    .frame(width: geo.size.width/20, height:18)
                    .padding(.leading,geo.size.width/2)
                    
            }
            VStack( alignment: .center, spacing: 2){
                Image(imageBarName)
                    .resizable()
                    .scaledToFit()
                    .frame(width:35,height: 35)
                
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct FavoritesTopBarItem_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesTopBarItem( imageBarName: "grid", isSelected: true)
    }
}
