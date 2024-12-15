//
//  LoginViewModel.swift
//  Coordinator
//
//  Created by Parthasarathy Gudivada on 12/15/24.
//

import Foundation
import Observation

@Observable @MainActor
final class LoginViewModel {
    var username: String = ""
    var password: String = ""
    var isSecure: Bool = true

    var isFetching = false
    var isAuthenticated = false

    func validateUser() {
        Task {
            isFetching = true
            defer {
                isFetching = false
            }

            try await Task.sleep(for: .seconds(1))
            isAuthenticated = username == "Secret" && password == "password"
        }
    }
}
