//
//  searchItemCard.swift
//  good food
//
//  Created by Zeynia Wax on 2023/01/12.
//

import SwiftUI

struct searchItemCard: View {
    var searchCard: Result
    
    var body: some View {
        
        VStack(alignment: .leading, spacing:5.0){
            
            AsyncImage(url: URL(string: searchCard.image ?? "" )){ image in
                image
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: 280,height: 200)
                    .cornerRadius(15)
                    .padding(.leading,60)
                    .padding(.top,30)
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading, spacing:2){
                
                Text(searchCard.title ?? "")
                    .padding(.leading)
                    .font(.title2)
                    .bold()
                    .foregroundColor(.green)
                    .padding(.leading,65)
                
                HStack(spacing:0.0){
                    Image(systemName: "heart")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 34,height: 34)
                        .foregroundColor(.pink)
                        .padding(.trailing,55)
                }.padding(20)
            }
        }
        
        .background(Rectangle()
            .frame(width: 350, height: 350)
            .foregroundColor(.white))
        .cornerRadius(50)
        .shadow(radius: 15)
        
        .padding(20)
    }
}

//struct searchItemCard_Previews: PreviewProvider {
//    static var previews: some View {
//        searchItemCard()
//    }
//}
