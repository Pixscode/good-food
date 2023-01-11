import SwiftUI

struct RandomRecipeCards: View {
    @ObservedObject var randomRecipe = randomRecipeManager()
    @EnvironmentObject var recipe:  randomRecipeManager
    @Binding var show: Bool
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum:270))
    ]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: adaptiveColumns,spacing:20){
                //                VStack{
                //                    ForEach(randomRecipe.recipes?.recipes ?? [],id :\.self){Recipe in
                //                        VStack{
                //
                //                            AsyncImage(url: URL(string: Recipe.image )){ image in
                //                                image
                //                                    .resizable()
                //                                    .aspectRatio( contentMode: .fill)
                //                                    .frame(width: 375,height: 200)
                //                                    .cornerRadius(15)
                //                                    .padding()
                //                            } placeholder: {
                //                                ProgressView()
                //                            }
                //                            VStack{
                //
                //                                Text(Recipe.title ?? "")
                //                                    .padding(.leading)
                //                                    .font(.title2)
                //                                    .bold()
                //                                    .foregroundColor(.green)
                //                                    .padding()
                //
                //                                HStack(spacing:10.0){
                //                                    Label("\(Recipe.readyInMinutes)", systemImage: "clock.fill"
                //                                    )
                //                                    .font(.title2)
                //                                    .foregroundColor(.pink)
                //                                    .labelStyle(.titleAndIcon)
                //                                    .padding(.leading,15)
                //                                    .padding(.top,2)
                //                                    Spacer()
                //                                    Image(systemName: "heart")
                //                                        .resizable()
                //                                        .aspectRatio(contentMode: .fit)
                //                                        .frame(width: 34,height: 34)
                //                                        .foregroundColor(.pink)
                //                                        .padding(.trailing,55)
                //                                }.padding()
                //                            }
                //                        }
                //                        .background(Rectangle()
                //                            .frame(width: 600, height: 400)
                //                            .foregroundColor(.white))
                //                        .cornerRadius(20)
                //                        .shadow(radius: 15)
                //
                //                        .padding()
                //                    }
                //
                //                }
                //            }
                //        }
                //    }
                //}
                VStack(alignment: .leading, spacing:5.0){
                    
                    Image("breakfast")
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width: 280,height: 200)
                        .cornerRadius(15)
                        .padding(.leading,60)
                        .padding(.top,30)
                    VStack(alignment: .leading, spacing:2){
                        
                        Text("BlueBerry And Banana French Toast")
                            .padding(.leading)
                            .font(.title2)
                            .bold()
                            .foregroundColor(.green)
                            .padding(.leading,65)
                        
                        HStack(spacing:0.0){
                            Label("10 min", systemImage: "clock.fill"
                            )
                            .font(.title2)
                            .foregroundColor(.pink)
                            .labelStyle(.titleAndIcon)
                            .padding(.leading,60)
                            .padding(.top,1)
                            Spacer()
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
    }
}
struct RandomRecipeCards_Previews: PreviewProvider {
    static var previews: some View {
        RandomRecipeCards(show:.constant(true)).environmentObject(randomRecipeManager())
        
    }
}



