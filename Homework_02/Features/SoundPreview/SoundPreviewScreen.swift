//
//  SoundPreviewScreen.swift
//  Homework_02
//
//  Created by Олег on 30.03.2021.
//

import SwiftUI

struct SoundPreviewScreen: View {
    
    @State var id: Int64?
    
    @ObservedObject var viewModel = SoundPreviewViewModel.init()
    @EnvironmentObject var router: NavigationController
    
    var body: some View {
        VStack {
            if isDownloading { ActivityIndicatorView() }
            else {
                NavigationView {
                    VStack(alignment: .leading) {
                        if let desc = viewModel.sound?.desc { textView(desc) }
                        if let duration = viewModel.sound?.duration { textView("duration: \(duration)") }
                        Spacer()
                        HStack {
                            Spacer()
                            Button("Play") { router.show(SoundPlayerScreen()) }
                            Spacer()
                        }
                        Spacer()
                    }.navigationTitle(Text(title))
                    
                }
            }
        }.onAppear() {
            if let id = id { viewModel.load(id: id) }
        }
    }
    
    private func textView(_ text: String) -> some View {
        HStack { Text(text); Spacer() }.padding(20)
    }
    
    private var isDownloading: Bool { id == nil || viewModel.isPageLoading }
    private var title: String { viewModel.sound?.name ?? "Something went wrong" }
}

