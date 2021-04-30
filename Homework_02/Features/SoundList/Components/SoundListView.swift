//
//  SoundListView.swift
//  Homework_02
//
//  Created by Олег on 29.03.2021.
//

import SwiftUI

struct SoundListView: View {

    @ObservedObject var viewModel: SoundListViewModel
    private let router: NavigationController? = try? Services.inject(NavigationController.self)
    
    var body: some View {
        
        if viewModel.noSounds {
            ActivityIndicatorView()
        } else {
            List(viewModel.sounds) { sound in cell(for: sound) }
        }
        
    }
    
    private func cell(for sound: Sound) -> some View {
        SoundListCell(item: sound, displayDownloading: isDownloadNeeded(for: sound))
            .onAppear() {
                if viewModel.isSoundLast(sound) { viewModel.loadPage() }
            }
            .onTapGesture {
                router?.show(SoundPreviewScreen(id: sound.identifier))
            }
    }
    
    private func isDownloadNeeded(for currentSound: Sound) -> Bool {
        viewModel.isSoundLast(currentSound) && viewModel.isPageLoading
    }
    
}

struct SoundListCell: View {
    
    let item: Sound
    
    let displayDownloading: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.name ?? "<unknown>").font(.headline)
            if displayDownloading {
                Divider()
                ActivityIndicator()
            }
        }
    }
    
}


