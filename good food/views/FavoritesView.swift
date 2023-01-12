//
//  FavoritesView.swift
//  good food
//
//  Created by Zeynia Wax on 2023/01/09.
//

import SwiftUI

//struct FavoritesView: View {
//    @State var selectedlayout: Viewlayout = .row
//    @State var selectedTab: Tabs = .home
//    @State var show = false
//    var body: some View {
//        NavigationView{
//            VStack{
//                Text("Favourite Meals")
//                    .font(.largeTitle.bold())
//                    .foregroundColor(.purple)
//
////                FavoriteDisplayBar()
//                if !show {
//                    RandomRecipeCards(show:$show)
//                        .onTapGesture {
//                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)){
//                                show.toggle()
//                            }
//                        }
//                    Spacer()
//                }
//
//                if show {
//                    RandomRecipeDetailview(show: $show)
//                }
//                TabBar(selectedTab: $selectedTab)
//            }
//
//        }
//
//
//    }
//}
//
//struct FavoritesView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoritesView()
//    }
//}
