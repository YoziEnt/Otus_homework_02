//
//  SoundPreviewViewModel.swift
//  Homework_02
//
//  Created by Олег on 30.03.2021.
//

import SwiftUI

final class SoundPreviewViewModel: ObservableObject {
    
    private let soundApi: SoundApi? = try? Services.inject(SoundApi.self)
    
    @Published private(set) var sound: Sound?
    @Published private(set) var isPageLoading: Bool = false
    
    func load(id: Int64) {
        guard !(isPageLoading) else { return }
        isPageLoading = true
        soundApi?.getSoundById(soundId: id) { response, error in
            if let result = response {
                self.sound = result
            }
            self.isPageLoading = false
        }
    }
    
}
