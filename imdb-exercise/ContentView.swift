//
//  ContentView.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 3.12.2022.
//

import SwiftUI
import Kingfisher
import CoreData

struct ErrorMessage: Identifiable {
    var id: String { message }
    let message: String
}

struct ContentView: View {
    let adapter: ContentViewAdapter
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Movie.title, ascending: true)],
        animation: .default)
    
    private var items: FetchedResults<Movie>
    
    @State private var message: ErrorMessage?
    
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        adapter.GetMovieDetailsPage(m: item)
                    } label: {
                        HStack{
                            KFImage.url(item.image)
                                .resizable()
                                .frame(width: 40, height: 50)
                            Text(item.title!).font(.headline)
                        }
                    }
                }
            }
        }
        .alert(item: $message) { message in
            Alert(title: Text("Error"), message: Text(message.message), dismissButton: .cancel())
        }
        .searchable(text: $searchText, prompt: "Look for something")
        .onChange(of: searchText) { newValue in
            //TODO: API gives limited requests so put this limit (Avoided overkill)
            if (newValue.count < 2) {
                return
            }
            adapter.SearchMovies(title: newValue, completion: handleSearchResponse(r:))
        }
    }
    
    private func handleSearchResponse(r: Result<[MovieDetail], ViewError>){
        switch r {
        case .success(let r):
            withAnimation { adapter.CacheMovies(ms: r) }
        case .failure(let err): // Create new Alert
            switch err {
            case .message(let m): message = ErrorMessage(message: m)
            default: message = ErrorMessage(message: message?.message ?? "")
            }
            debugPrint(err)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let movieRepository = MovieRepository(context: PersistenceController.preview.container.viewContext)
        let a = ContentViewAdapter(movieRepository: movieRepository, imdb: IMDBMock())
        ContentView(adapter: a)
    }
}
