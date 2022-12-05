//
//  ContentView.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 3.12.2022.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @ObservedObject var adapter: ContentViewAdapter
    
    @State private var message: ErrorMessage?
    
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(Array(adapter.movies.enumerated()), id: \.1) { i, item in
                    NavigationLink {
                        adapter.GetMovieDetailsPage(m: item)
                    } label: {
                        HStack{
                            KFImage.url(item.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 50)
                            Text(item.title!).font(.headline)
                        }
                    }
                }
            }
        }
        .searchable(text: $searchText, prompt: "Look for something")
        .onSubmit(of: .search){
            adapter.SearchMovies(title: searchText, completion: handleSearchResponse(r:))
        }
        .alert(item: $message) { message in
            Alert(title: Text("Error"), message: Text(message.message), dismissButton: .cancel())
        }
        .onAppear{
            adapter.FetchMoviesFromCache()
        }
    }
    
    private func handleSearchResponse(r: Result<[MovieDetail], ViewError>){
        switch r {
        case .success(let r):
            withAnimation { adapter.CacheMovies(ms: r) }
        case .failure(let err): // Create new Alert
            switch err {
            case .message(let m): message = m
            case .internalError(let err): message = err
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let coordinator: iCoordinator = Coordinator()
        let movieRepository = MovieRepository(context: PersistenceController.preview.container.viewContext)
        let a = ContentViewAdapter(coordinator:coordinator, movieRepository: movieRepository, imdb: IMDBMock())
        ContentView(adapter: a)
    }
}
