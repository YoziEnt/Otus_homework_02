//
//  NavigationStack.swift
//  Homework_02
//
//  Created by Олег on 30.03.2021.
//

import SwiftUI

struct NavigationRouter<Content> : View where Content : View {
    
    @ObservedObject private var viewModel: NavigationViewModel
    
    private let controller: NavigationController
    
    private let content: Content
    
    init?(@ViewBuilder _ content: @escaping () -> Content) {
        guard let controller = try? Services.inject(NavigationController.self) else { return nil }
        self.content = content()
        self.controller = controller
        self.viewModel = controller.viewModel
    }
    
    var body: some View {
        if viewModel.atRoot {
            show(rootScreen: content)
        } else {
            viewModel.currentScreen
        }
    }
    
    private func show(rootScreen: Content) -> Content {
        controller.show(rootScreen)
        return rootScreen
    }
    
}

final class NavigationController : ObservableObject {
    
    let viewModel: NavigationViewModel = .init()
    
    var currentScreen: AnyView? { viewModel.currentScreen }
    
    func show<Screen : View>(_ screen: Screen) { viewModel.push(screen) }
    
    func pop() { viewModel.pop() }
    
    func toRoot() { viewModel.popToRoot() }
    
}


public final class NavigationViewModel: ObservableObject {

    @Published var currentScreen: AnyView?
    
    private var stack: [AnyView] = .init() { didSet { currentScreen = stack.last } }
    
    func push<Screen : View>(_ screen: Screen) { stack.append(screen.toAny) }
    
    func pop() { stack.removeLast() }
    
    func popToRoot() { stack.removeAll() }
    
    var atRoot: Bool { stack.isEmpty }
    
}

extension View {
    
    var toAny: AnyView { AnyView(self) }
    
}
