//
//  SoundPreviewScreen.swift
//  Homework_02
//
//  Created by Олег on 30.03.2021.
//

import SwiftUI

struct SoundPreviewScreen: View {
    
    @ObservedObject var viewModel = SoundPreviewViewModel.init()
    
    @State var id: Int64?
    
    var body: some View {
        VStack {
            if isDownloading {
                ActivityIndicatorView()
            } else {
                NavigationView {
                    VStack(alignment: .leading) {
                        SoundPreview(viewModel.sound)
                        SoundPreviewRoutingSheet()
                        Spacer()
                    }.navigationTitle(Text(title))
                    
                }
            }
        }.onAppear() {
            if let id = id { viewModel.load(id: id) }
        }
    }
    
    private var isDownloading: Bool { id == nil || viewModel.isPageLoading }
    private var title: String { viewModel.sound?.name ?? "Something went wrong" }
    
}

