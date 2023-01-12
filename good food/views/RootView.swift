//
//  ContentView.swift
//  good food
//
//  Created by Zeynia Wax on 2022/12/20.
//

import SwiftUI
import CoreData

struct RootView: View {
    @ObservedObject var SearchBarresult = SearchBarManager()
    @StateObject var recipes : randomRecipeManager
    @AppStorage("shouldShowOndoarding")var shouldShowOndoarding: Bool = true
    @State var selectedTab: Tabs = .home
    @State private var searchText = ""
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
                    TextField("Search for meal",text: $searchText)
                        .padding(20)
                        .background(.white,in: RoundedRectangle(cornerRadius: 15))
                        .shadow(color: .gray.opacity(0.9), radius: 5, x: 0, y: 5)
                        .padding(.horizontal)
                        .onSubmit {
                            SearchBarresult.getSearch(searchItem: searchText)
                        }
                        .submitLabel(.search)
                    if !searchText.isEmpty && !show {
                        ScrollView{
                            ForEach(SearchBarresult.searchResults?.results ?? [], id:\.self) { items in
                                searchItemCard( searchCard: items)
                            }
                        }
                    } else {
                        if !show   {
                            ForEach(recipes.recipes?.recipes ?? [],id :\.self){Recipe in
                                RandomRecipeCards(show: $show, recipecard: Recipe)
                                    .onTapGesture {
                                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)){
                                            show.toggle()
                                        }
                                    }
                                Spacer()
                            }
                        } else {
                            RandomRecipeDetailview(show: $show, recipe: recipes.recipes?.recipes?[0] ?? Recipe(id: 0, title: "", readyInMinutes: 0, servings: 0, image: "", instructions: ""), randomRecipe: recipes)
                        }
                    }
                    
                    
                                    Spacer()
                    //                .background(Image("background")
                    //                .ignoresSafeArea())
                    TabBar(selectedTab: $selectedTab)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)){
                                show.toggle()
                                
                            }
                            //            .environmentObject(recipes)
                        }
                }
                .fullScreenCover(isPresented: $shouldShowOndoarding, content: {
                    GoodFoodOndoardingView(shouldShowOndoarding: $shouldShowOndoarding)
                })
                
            }
            
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(recipes: randomRecipeManager())
.environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}


