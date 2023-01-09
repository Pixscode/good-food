//
//  SearchBar.swift
//  good food
//
//  Created by Zeynia Wax on 2023/01/04.
//
//
import SwiftUI

struct SearchBar: UIViewRepresentable{
    typealias UIViewType = UISearchBar
//    @ObservedObject var SearchBarresult = SearchBarManager()
//    @Binding var searchResults : String
//    @State private var searchText = ""


    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "looking for something Good"
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: Context) {
    }
    func makeCoordinator() -> searchBarCoordinator {
        return searchBarCoordinator()
    }
    class searchBarCoordinator: NSObject, UISearchBarDelegate {
//        init (searchResults:Binding<String>){
//            self._searchResults = searchResults
//        }
    }
}


struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
     SearchBar()
//        ( SearchBarresult: <#T##arg#>, searchResults: .searchText, searchText: "")
    }
}
