//
//  SoundListViewModel.swift
//  Homework_02
//
//  Created by Олег on 29.03.2021.
//

import SwiftUI

final class SoundListViewModel: ObservableObject {
    
    private let searchApi: SearchApi? = try? Services.inject(SearchApi.self)
    
    @Published private(set) var sounds: [Sound] = .init()
    @Published private(set) var pageNumber: Int = 0
    @Published private(set) var isPageLoading: Bool = false
    @Published var genre: Genre = .rock { didSet { genreDidChange() } }
    
    var isNoSounds: Bool { sounds.isEmpty }
    
    func isSoundLast(_ sound: Sound) -> Bool { sounds.isLast(sound) }
    
    func loadPage() {
        guard !(isPageLoading) else { return }
        isPageLoading = true
        pageNumber += 1
        searchApi?.searchText(filter: genre.rawValue, page: pageNumber)  { response, error in
            defer { self.isPageLoading = false }
            guard let results = response?.results else { return }
            self.sounds.append(contentsOf: results)
        }
    }
    
    private func genreDidChange() {
        sounds.removeAll()
        pageNumber = 0
        loadPage()
    }
    
}
