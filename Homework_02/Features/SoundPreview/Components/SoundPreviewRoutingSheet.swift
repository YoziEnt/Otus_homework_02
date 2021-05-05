//
//  SoundPreviewRoutingSheet.swift
//  Homework_02
//
//  Created by Олег Мишкин on 05.05.2021.
//

import SwiftUI

struct SoundPreviewRoutingSheet : View {
    
    private let router: NavigationController? = try? Services.inject(NavigationController.self)
    
    var body: some View {
        HStack {
            Spacer()
            Button("Go back") { router?.pop() }
            Spacer()
            Button("Play") { router?.show(SoundPlayerScreen()) }
            Spacer()
        }
    }

}
