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
        .onAppear {
            Task {
                await self.adapter.FetchMovieRatings()
            }
        }
        .alert(item: $adapter.alertMessage) { alertMessage in
            Alert(title: Text("Error"), message: Text(alertMessage.message), dismissButton: .cancel())
        }
    }
}
