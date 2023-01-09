//
//  ContentView.swift
//  good food
//
//  Created by Zeynia Wax on 2022/12/20.
//

import SwiftUI
import CoreData

struct RootView: View {
//    @ObservedObject var SearchBarresult = SearchBarManager()
    @StateObject var recipes : randomRecipeManager
    @AppStorage("shouldShowOndoarding")var shouldShowOndoarding: Bool = true
    @State var selectedTab: Tabs = .home
//    @State private var searchText = ""
    @State var show = false
    
    var body: some View{
        NavigationView{
            VStack{
                VStack{
                    Image("logo")
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: 80,height: 80)
                        .padding()
                    Text("In the Mood for Something New")
                        .font(.title2.weight(.semibold))
                        .padding()
                    SearchBar()
                    
                    if !show {
                        RandomRecipeCards(show:$show)
                            .onTapGesture {
                                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)){
                                    show.toggle()
                                }
                            }
                        Spacer()
                    }
                    
                    if show {
                        RandomRecipeDetailview(show: $show)
                    }
                    //                Spacer()
                } .background(Image("background")
                    .ignoresSafeArea())
                TabBar(selectedTab: $selectedTab)
                
            }
            .environmentObject(recipes)
        }
    }
    //        .fullScreenCover(isPresented: $shouldShowOndoarding, content: {
    //            GoodFoodOndoardingView(shouldShowOndoarding: $shouldShowOndoarding)
    //        })
}



struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(recipes: randomRecipeManager())
//.environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}


