//
//  FavoritesView.swift
//  good food
//
//  Created by Zeynia Wax on 2023/01/09.
//

import SwiftUI

struct FavoritesView: View {
    @State var selectedlayout: Viewlayout = .row
    @State var selectedTab: Tabs = .home
    var body: some View {
        NavigationView{
            VStack{
                Text("Favourite Meals")
                    .font(.largeTitle.bold())
                    .foregroundColor(.purple)
                
                FavoriteDisplayBar()
                
                TabBar(selectedTab: $selectedTab)
            }
           
        }
        
        
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
