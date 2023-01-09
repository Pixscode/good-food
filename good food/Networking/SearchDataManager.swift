//SEARCHFORRECIPE
import Foundation

// https://api.spoonacular.com/recipes/complexSearch?apiKey=857583577d2a4f08a8a585dc7a556622&query=pasta&maxFat=25&number=2
//API KEY TWO :https://api.spoonacular.com/recipes/complexSearch?apiKey=acf2fa74bf8943628007634765e25685&query=pasta&maxFat=25&number=2

//5343d891cc7c4168b59995c3dfd44259


struct SearchModel: Codable {
    let results: [Result]?
    let offset, number, totalResults: Int?
}

// MARK: - Result
struct Result: Codable,Hashable {
    let id: Int?
    let title: String?
    let image: String?
    let imageType: String?
    static func == (lhs: Result, rhs: Result) -> Bool {
        return lhs.image == rhs.image && lhs.title == lhs.title
      }
      func hash(into hasher: inout Hasher) {
        hasher.combine(image )
      }
}

class SearchBarManager:ObservableObject{
    @Published var searchResults : SearchModel?
    
    var endpoint = "https://api.spoonacular.com/recipes/complexSearch?apiKey=857583577d2a4f08a8a585dc7a556622"
//    var endpoint = "https://api.spoonacular.com/recipes/complexSearch?apiKey=5343d891cc7c4168b59995c3dfd44259"
    init(searchResults: SearchModel? = nil ) {
        self.searchResults = searchResults
        getSearch(searchItem: "")
    }
    
    func getSearch(searchItem : String ){
        guard let url = URL(string:"https://api.spoonacular.com/recipes/complexSearch?apiKey=5343d891cc7c4168b59995c3dfd44259&query=\(searchItem)") else { fatalError("Missing URL") }

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
                        let decodedUsers = try JSONDecoder().decode(SearchModel.self, from: data)
                        self.searchResults = decodedUsers
                        print(decodedUsers)
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
    
        
    }
    



