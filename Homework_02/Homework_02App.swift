//
//  Homework_02App.swift
//  Homework_02
//
//  Created by Олег on 26.03.2021.
//

import SwiftUI

@main
struct Homework_02App: App {
    
    init() {
        configurateApp()
    }
    
    private func configurateApp() {
        Services.add(SoundApi.self) { ActualSoundApi() }
        Services.add(SearchApi.self) { ActualSearchApi() }
        Services.add(NavigationController.self, injection: .singleton) { NavigationController() }
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
    
}
