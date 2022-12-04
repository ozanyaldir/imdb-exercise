//
//  MovieDetailView.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 4.12.2022.
//

import SwiftUI
import Kingfisher

struct MovieDetailView: View {
    let movieDetailViewModel: MovieDetailViewModel
    
    var body: some View {
        NavigationView {
            List {
                KFImage.url(movieDetailViewModel.image!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 140, height: 180)
                Text(movieDetailViewModel.description ?? "Undefined")
            }
        }
        .navigationBarTitle(movieDetailViewModel.title ?? "Undefined")
        .navigationBarTitleDisplayMode(.inline)
    }
}
