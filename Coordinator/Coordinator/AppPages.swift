//
//  AppPages.swift
//  Coordinator
//
//  Created by Mayank Gupta on 23/07/24.
//

import Foundation

enum AppPages: Hashable {
    case main
    case login
}

enum Sheet: String, Identifiable {
    var id: String {
        rawValue
    }
    
    case forgotPassword
}

enum FullScreenCover: String, Identifiable {
    var id: String {
        rawValue
    }
    
    case signup
}

