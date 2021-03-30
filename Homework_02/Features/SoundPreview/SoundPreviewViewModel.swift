//
//  SoundPreviewViewModel.swift
//  Homework_02
//
//  Created by Олег on 30.03.2021.
//

import SwiftUI

final class SoundPreviewViewModel: ObservableObject {
    
    @Published private(set) var sound: Sound?
    @Published private(set) var isPageLoading: Bool = false
    
    func load(id: Int64) {
        guard !(isPageLoading) else { return }
        isPageLoading = true
        SoundAPI.getSoundById(soundId: id) { response, error in
            if let result = response {
                print(result)
                self.sound = result
            }
            self.isPageLoading = false
        }
    }
}
