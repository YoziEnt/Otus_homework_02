//
//  SoundListScreen.swift
//  Homework_02
//
//  Created by Олег on 29.03.2021.
//

import SwiftUI

struct SoundListScreen: View {
    
    @ObservedObject var viewModel = SoundListViewModel.init()
    
    @State private var genre: Genre = .rock

    var body: some View {
        NavigationView {
            VStack {
                GenrePickerView(choosenItem: $viewModel.genre, title: "Genre:")
                SoundListView(viewModel: viewModel)
                Spacer()
            }.navigationTitle(Text("FREESOUND"))
        }
        .onAppear() {
            viewModel.loadPage()
        }

    }
    
}
