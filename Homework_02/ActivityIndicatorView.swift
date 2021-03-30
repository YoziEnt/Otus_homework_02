//
//  ActivityIndicatorView.swift
//  Homework_02
//
//  Created by Олег on 30.03.2021.
//

import SwiftUI

public struct ActivityIndicatorView: UIViewRepresentable {
    
    public init() {}
    
    public func makeUIView(context: UIViewRepresentableContext<ActivityIndicatorView>) -> UIActivityIndicatorView {
        UIActivityIndicatorView(style: .large)
    }
    
    public func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicatorView>) {
        uiView.startAnimating()
    }
}

public struct ActivityIndicator: View {
    
    public var body: some View {
        HStack {
            Spacer()
            ActivityIndicatorView()
            Spacer()
        }
    }
    
}
