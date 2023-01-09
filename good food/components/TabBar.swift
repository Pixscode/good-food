//
//  SwiftUIView.swift
//  good food
//
//  Created by Zeynia Wax on 2023/01/06.
//

import SwiftUI

enum Tabs: Int {
    case home = 0
    case favoriteMeal = 1
    
}

struct TabBar: View {
    @Binding var selectedTab:Tabs
    var body: some View {
        HStack{
            
            Button{
                //switch to home.
                selectedTab = .home
                
            }label: {
                
                TabBarButton(buttonText: "Home",
                             imageName: "home",
                             isActive: selectedTab == .home)
            }
            Button {
                selectedTab = .favoriteMeal
            }
            
        label: {
            
            TabBarButton(buttonText: "Favorite Meal",
                         imageName: "favoriteSaved",
                         isActive: selectedTab == .favoriteMeal)
        }
            
        }
        .frame(height: 82)
    }
}


struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(selectedTab: .constant(.home))
    }
}
