//
//  RandR.swift
//  good food
//
//  Created by Zeynia Wax on 2023/01/08.
//

import SwiftUI

struct RandomRecipeDetailview: View {
    @Binding var show:Bool
    //    @EnvironmentObject var recipes: randomRecipeManager
    @ObservedObject var randomRecipe = randomRecipeManager()
    var body: some View {
        ZStack{
            ScrollView{
                cover
            }
            .background(Image("background"))
            .ignoresSafeArea()
            
            Button {
                withAnimation(.spring(response: 0.6,dampingFraction: 0.8)){
                    show.toggle()
                }
            }label:{
                Image(systemName: "xmark")
                    .font(.title3.weight(.bold))
                    .foregroundColor(.pink)
                    .padding(8)
                    .background(.white, in: Circle())
            }
            .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .topTrailing)
            .padding(29)
            .ignoresSafeArea()
            
            
        }
        
    }
    
    //    var cover: some View{
    //        VStack(alignment: .leading,spacing: 15) {
    //            Image("supper")
    //                .resizable()
    //                .aspectRatio(1, contentMode: .fill)
    //                .frame(maxWidth: 600,maxHeight: 200)
    //            Text("poko ball with chicken and corn")
    //                .font(.largeTitle.weight(.bold))
    //                .bold()
    //                .foregroundColor(.green)
    //                .padding(.top,120)
    //                .padding(.leading,20)
    //            HStack{
    //                Label("10min",systemImage: "clock.fill")
    //                    .font(.title2.weight(.semibold))
    //                    .foregroundColor(.pink)
    //                    .frame(maxWidth:.infinity,alignment: .leading)
    //                    .labelStyle(.titleAndIcon)
    //                    .padding(.leading,15)
    //                    .padding(.top,2)
    //                Spacer()
    //                Image(systemName: "heart")
    //                    .resizable()
    //                    .aspectRatio( contentMode: .fit)
    //                    .frame(width: 35,height: 35)
    //                    .padding(.trailing,60)
    //                    .foregroundColor(.pink)
    //            }
    //            Text("Ingredients Need")
    //                .foregroundColor(.black)
    //                .font(.title)
    //                .bold()
    //                .padding()
    //            Text("ingredients list here")
    //                .font(.title3)
    //                .padding()
    //            Text("Lets Start Cooking ")
    //
    //                .foregroundColor(.black)
    //                .font(.title)
    //                .bold()
    //                .padding()
    //            Text("how to make goes here ")
    //                .font(.title3)
    //                .padding()
    //
    //        }
    //    }
    var cover: some View{
        ForEach(randomRecipe.recipes?.recipes ?? [],id :\.self){Recipe in
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: Recipe.image )){ image in
                    image
                        .resizable()
                        .aspectRatio(1, contentMode: .fill)
                        .frame(maxWidth: 600,maxHeight: 200)
                } placeholder: {
                    ProgressView()
                }
                Text(Recipe.title ?? "")
                    .font(.largeTitle.weight(.bold))
                    .bold()
                    .foregroundColor(.green)
                    .padding(.top,120)
                    .padding(.leading,20)
                HStack{
                    Label("\(Recipe.readyInMinutes)", systemImage: "clock.fill")
                        .font(.title2.weight(.semibold))
                        .foregroundColor(.pink)
                        .frame(maxWidth:.infinity,alignment: .leading)
                        .labelStyle(.titleAndIcon)
                        .padding(.leading,15)
                        .padding(.top,2)
                    Spacer()
                    Image(systemName: "heart")
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: 35,height: 35)
                        .padding(.trailing,60)
                        .foregroundColor(.pink)
                }
                Text("Ingredients Need")
                    .foregroundColor(.black)
                    .font(.title)
                    .bold()
                    .padding()
                Text("ingredients list here")
                    .font(.title3)
                    .padding()
                Text("Lets Start Cooking ")
                
                    .foregroundColor(.black)
                    .font(.title)
                    .bold()
                    .padding()
                Text(Recipe.instructions ?? "")
                    .font(.title3)
                    .padding()
                
            }
        }
    }
}


struct RandomRecipeDetailview_Previews: PreviewProvider {
    static var previews: some View {
        RandomRecipeDetailview(show:.constant(true))
    }
}
