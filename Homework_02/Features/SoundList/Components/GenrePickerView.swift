//
//  GenrePickerView.swift
//  Homework_02
//
//  Created by Олег on 30.03.2021.
//

import SwiftUI

struct GenrePickerView: View {
    
    @Binding var choosenItem: Genre
    
    var title: String
    
    var body: some View {
        
        Picker(title, selection: $choosenItem) {
            Text("Rock").tag(Genre.rock)
            Text("Rap").tag(Genre.rap)
            Text("Pop").tag(Genre.pop)
        }.pickerStyle(SegmentedPickerStyle())
        
    }
    
}

