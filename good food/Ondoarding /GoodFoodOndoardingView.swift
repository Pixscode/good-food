
import Foundation
import SwiftUI

struct GoodFoodOndoardingView: View {
    @Binding var shouldShowOndoarding:Bool
    var body: some View {
        TabView{
            pageView(
                shouldShowOndoarding: $shouldShowOndoarding, messsage: "Instead of going out to dinner, Use good food for the best Meals made by you for you.it's more important to make yourself feel good.")
                .background(Image("background")
                    .ignoresSafeArea())
            pageView(
                shouldShowOndoarding: $shouldShowOndoarding, messsage: "Good Food is a Recipe app that helps you create great tasting meals in the comfort of you home from scratch. ")
                .background(Image("background"))
            
            
            pageView(shouldShowOndoarding: $shouldShowOndoarding, messsage: "search for Recipes to suit your pantry,Cater your shopping trips around recipes.Add a recipe to your Favourites or get random  recipes if you want to take your taste buds on an adventure.Good Food has endless possibilities ")
            
                .background(Image("background")
                    .ignoresSafeArea())
           welcomePage(
            shouldShowOndoarding: $shouldShowOndoarding, showDismissButton:true
           )
                .background(Image("Welcome")
                    .ignoresSafeArea())
                    .aspectRatio(contentMode: .fill)
                    .padding()
        }
        .tabViewStyle(PageTabViewStyle())
    
    }
}
struct pageView:View {
    @Binding var shouldShowOndoarding:Bool
    let messsage: String
    var body: some View {
        VStack(alignment: .center){
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150,height: 150)
                .padding(.vertical, 4.0)
            Text(messsage)
                .font(.system(size:20))
                .multilineTextAlignment(.center)
                .padding()
                
        }
    }
}
struct welcomePage:View {
    @Binding var shouldShowOndoarding:Bool
    let showDismissButton:Bool
    var body: some View {
        VStack(alignment: .center){
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
               .frame(width: 150,height: 150)
    
           
            Text("Happy Cooking")
                .font(.system(size:70))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30.0)
            
            if showDismissButton { Button(
                action: {
                    shouldShowOndoarding.toggle()
                    //some code
                },label: {
                    Text("Get Started")
                        .frame(width: 250,height: 50)
                        .font(.title)
                        .bold()
                        .foregroundColor(Color.white)
                        .background(Color(.blue))
                        .cornerRadius(6)
                    
                }
            )}
            
            
          
                
        }
    }
}
struct GoodFoodOndoardingView_PreviewProvider {
    static var preview:some View{
        GoodFoodOndoardingView(shouldShowOndoarding: .constant(true))
    }
}

