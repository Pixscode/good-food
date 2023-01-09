//
//  FavoriteDisplayBar.swift
//  good food
//
//  Created by Zeynia Wax on 2023/01/09.
//

import SwiftUI
enum Viewlayout: Int {
    case row = 0
    case grid = 1
    
}

struct FavoriteDisplayBar: View {
@State var selected = "row"
    
    var body: some View {
        VStack{
            ZStack{
                HStack(spacing: 15){
                    
                        Button(action: {
                            self.selected = "row"
                        }){
                            VStack{
                            Image("row")
                                .resizable()
                                .frame(width:35,height: 35)
                            Circle()
                                .fill(self.selected == "grid" ? Color.pink : Color.clear)
                                .frame (width: 8, height: 8)
                                .padding(.vertical,4)
                            
                            
                        }
                    }
                    
                        Button(action: {
                            self.selected = "grid"
                            
                            
                        }){
                            VStack{
                            Image("grid")
                                .resizable()
                                .frame(width:35,height: 35)
                            Circle()
                                .fill(self.selected == "row" ? Color.pink : Color.clear)
                                .frame (width: 8, height: 8)
                                .padding(.vertical,4)
                            
                        }
                    }
                    
                }
            }.padding()
                .padding([.top,.horizontal])
                .background(Color.white)
            Spacer()
            
            
        }
        .background(Color("gray"))
//        windowView()
    }
    
}
//func windowView(){
//    let scenes = UIApplication.shared.connectedScenes
//    let windowScenes = scenes.first as? UIWindowScene
//    let window = windowScenes?.windows.first}

struct FavoriteDisplayBar_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteDisplayBar()
    }
}
