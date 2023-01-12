import SwiftUI

struct RandomRecipeCards: View {
//    @ObservedObject var randomRecipe: randomRecipeManager
//    @EnvironmentObject var recipe:  randomRecipeManager
    @Binding var show: Bool
    var recipecard: Recipe
    var body: some View {
                VStack(alignment: .leading, spacing:5.0){
                    AsyncImage(url: URL(string: recipecard.image )){ image in
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

                        Text(recipecard.title ?? "")
                            .padding(.leading)
                            .font(.title2)
                            .bold()
                            .foregroundColor(.green)
                            .padding(.leading,65)

                        HStack(spacing:0.0){
                            Label("\(recipecard.readyInMinutes)", systemImage: "clock.fill")
                            
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
//struct RandomRecipeCards_Previews: PreviewProvider {
//    static var previews: some View {
//        RandomRecipeCards(randomRecipe: randomRecipeManager(), show:.constant(true)).environmentObject(randomRecipeManager())
//
//    }
//}



