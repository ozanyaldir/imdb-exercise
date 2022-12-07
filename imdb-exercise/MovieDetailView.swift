//
//  MovieDetailView.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 4.12.2022.
//

import SwiftUI
import Kingfisher

struct MovieDetailView: View {
    @ObservedObject var adapter: MovieDetailAdapter
    
    @State private var message: ErrorMessage?
    
    var body: some View {
        NavigationView {
            List {
                KFImage.url(adapter.viewModel.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 140, height: 180)
                Text(adapter.viewModel.fullTitle ?? "").font(.title)
                Text(adapter.viewModel.description ?? "")
                HStack{
                    Text("Year:").bold()
                    Text(adapter.viewModel.year ?? "")
                }
                HStack{
                    Text("imDb:").bold()
                    Text(adapter.viewModel.imDb ?? "")
                }
                HStack{
                    Text("metacritic:").bold()
                    Text(adapter.viewModel.metacritic ?? "")
                }
                HStack{
                    Text("theMovieDb:").bold()
                    Text(adapter.viewModel.theMovieDb ?? "")
                }
                HStack{
                    Text("rottenTomatoes:").bold()
                    Text(adapter.viewModel.rottenTomatoes ?? "")
                }
                HStack{
                    Text("filmAffinity:").bold()
                    Text(adapter.viewModel.filmAffinity ?? "")
                }
            }
        }
        .navigationBarTitle(adapter.viewModel.title ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear{
            self.adapter.FetchMovieRatings(completion: handleSearchResponse(r:))
        }
        .alert(item: $message) { message in
            Alert(title: Text("Error"), message: Text(message.message), dismissButton: .cancel())
        }
    }
    
    private func handleSearchResponse(r: Result<MovieDetailViewModel, ViewError>){
        switch r {
        case .success(_): break
        case .failure(let err): // Create new Alert
            switch err {
            case .message(let m): message = m
            case .internalError(let err): message = err
            }
        }
    }
}
