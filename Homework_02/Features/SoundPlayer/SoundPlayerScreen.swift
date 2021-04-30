//
//  SoundPlayerScreen.swift
//  Homework_02
//
//  Created by Олег on 31.03.2021.
//

import SwiftUI

struct SoundPlayerScreen: View {
    
    private let router: NavigationController? = try? Services.inject(NavigationController.self)
    
    var body: some View {
        HStack {
            Spacer()
            Button("go back") { router?.pop() }
            Spacer()
            Button("to root") { router?.toRoot() }
            Spacer()
        }
    }
}
