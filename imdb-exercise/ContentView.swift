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
            Task {
                await adapter.SearchMovies(title:searchText)
            }
        }
        .onAppear{
            withAnimation{
                adapter.FetchMoviesFromCache()
            }
        }
        .alert(item: $adapter.alertMessage) { alertMessage in
            Alert(title: Text("Error"), message: Text(alertMessage.message), dismissButton: .cancel())
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
