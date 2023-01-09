//
//  File.swift
//  good food
//
//  Created by Zeynia Wax on 2023/01/06.
//

import Foundation
////
////struct ExtendedIngredient: Codable {
////    let id: Int?
////    let aisle, image: String?
////    let consistency: Consistency?
////    let name, nameClean, original, originalName: String?
////    let amount: Double?
////    let unit: String?
////    let meta: [String]?
////    let measures: Measures?
////}
//// https://api.spoonacular.com/recipes/autocomplete?apiKey=857583577d2a4f08a8a585dc7a556622&number=10&query=chick
//let endpoint = "https://api.spoonacular.com/recipes/random?apiKey=a9c72f456a80e4a369757fc5aa07a4acf=1"
//
//init(recipes: RandomRecipe? = nil) {
//    self.recipes = recipes
//    getUsers()
////        print(self.recipes)
//}
//func getUsers() {
//    guard let url = URL(string:endpoint) else { fatalError("Missing URL") }
//
//    let urlRequest = URLRequest(url: url)
//
//    let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//        if let error = error {
//            print("Request error: ", error)
//            return
//        }
//
//        guard let response = response as? HTTPURLResponse else { return }
//        if response.statusCode == 200 {
//            guard let data = data else { return }
//            DispatchQueue.main.async {
//                do {
//                    let decodedUsers = try JSONDecoder().decode(RandomRecipe.self, from: data)
//                    self.recipes = decodedUsers
////                        print(self.recipes)
//                } catch let error {
//                    print("Error decoding: ", error)
//                }
//            }
//        }
//    }
//
//    dataTask.resume()
//}
//
//}


