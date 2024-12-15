//
//  Coordinator.swift
//  Coordinator
//
//  Created by Mayank Gupta on 20/07/24.
//

import Foundation
import Observation
import SwiftUI

@Observable
final class Coordinator {
    var path: NavigationPath = NavigationPath()
    var sheet: Sheet?
    var fullScreenCover: FullScreenCover?

    func push(page: AppPages) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func presentSheet(_ sheet: Sheet) {
        self.sheet = sheet
    }
    
    func presentFullScreenCover(_ cover: FullScreenCover) {
        self.fullScreenCover = cover
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func dismissCover() {
        self.fullScreenCover = nil
    }
    
    @ViewBuilder @MainActor
    func build(page: AppPages) -> some View {
        switch page {
        case .main:
            WalkthroughView()

        case .login:
            LoginView(viewModel: LoginViewModel())
        }
    }
    
    @ViewBuilder @MainActor
    func buildSheet(sheet: Sheet) -> some View {
        switch sheet {
        case .forgotPassword:
                ForgotPasswordView(viewModel: ForgotPasswordViewModel())
        }
    }
    
    @ViewBuilder @MainActor
    func buildCover(cover: FullScreenCover) -> some View {
        switch cover {
        case .signup:
            SignupView(viewModel: SignupViewModel())
        }
    }
}
