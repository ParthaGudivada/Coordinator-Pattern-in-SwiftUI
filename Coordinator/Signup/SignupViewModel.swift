//
//  SignupViewModel.swift
//  Coordinator
//
//  Created by Parthasarathy Gudivada on 12/15/24.
//

import Foundation
import Observation

@Observable
final class SignupViewModel {
    var username: String = ""
    var email: String = ""
    var password: String = ""
    var confirmPassword: String = ""
    var isSecure: Bool = true
    
}


