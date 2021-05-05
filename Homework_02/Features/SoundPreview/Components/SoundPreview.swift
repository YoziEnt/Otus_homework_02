//
//  SoundPreview.swift
//  Homework_02
//
//  Created by Олег Мишкин on 05.05.2021.
//

import SwiftUI

struct SoundPreview : View {
    
    private let sound: Sound?
    
    init(_ sound: Sound?) {
        self.sound = sound
    }
    
    var body: some View {
        if let desc = sound?.desc { textView(desc) }
        if let duration = sound?.duration { textView("duration: \(duration)") }
    }
    
    private func textView(_ text: String) -> some View {
        HStack { Text(text); Spacer() }.padding(20)
    }
    
}
