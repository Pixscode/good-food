import Foundation
import SwiftUI

//https://api.spoonacular.com/food/ingredients/search?apiKey=857583577d2a4f08a8a585dc7a556622&query=banana&number=2&sort=calories&sortDirection=desc
//https://api.spoonacular.com/recipes/random?apiKey=857583577d2a4f08a8a585dc7a556622&number=1&tags=vegetarian,dessert
//APITWO :apiKey=9c72f456a80e4a369757fc5aa07a4acf

struct RandomRecipe: Codable {
   var recipes: [Recipe]?
}

struct Recipe: Codable,Hashable{
  var id: Int?
    var title: String?
    var readyInMinutes, servings: Int
    var image: String
    var instructions: String?
    
    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        return lhs.image == rhs.image && lhs.title == lhs.title
      }
      func hash(into hasher: inout Hasher) {
        hasher.combine(image )
      }
}

//struct ExtendedIngredient: Codable,Hashable {
//    let id: Int?
//    let name, nameClean, original, originalName: String?
//    let amount: Double?
//    let unit: String?
//    static func == (lhs: ExtendedIngredient, rhs: ExtendedIngredient) -> Bool {
//        return lhs.name == rhs.name && lhs.amount == lhs.amount
//      }
//      func hash(into hasher: inout Hasher) {
//        hasher.combine(name )
//      }
//}
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case image
        case readyInMinture,Servings
      }


class randomRecipeManager: ObservableObject {
    @Environment(\.managedObjectContext) private var context
    @Published var recipes: RandomRecipe?
  let endpoint = "https://api.spoonacular.com/recipes/random?apiKey=857583577d2a4f08a8a585dc7a556622&number=3"
//    let endpoint = "https://api.spoonacular.com/recipes/random?apiKey=5343d891cc7c4168b59995c3dfd44259=3"

    init(recipes: RandomRecipe? = nil) {
        self.recipes = recipes
        getUsers()
//        print(self.recipes)
    }
    func getUsers() {
        guard let url = URL(string:endpoint) else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedUsers = try JSONDecoder().decode(RandomRecipe.self, from: data)
                        self.recipes = decodedUsers
//                        print(self.recipes)
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
    
}
