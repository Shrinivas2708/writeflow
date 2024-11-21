//
//  JWTManager.swift
//  WriteFlow
//
//  Created by Ram Borade on 16/11/24.
//

import Foundation

class JWTManager {
    static let shared = JWTManager()
    private let userDefaultsKey = "shrinivas"

    func saveToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: userDefaultsKey)
    }

    func getToken() -> String? {
        return UserDefaults.standard.string(forKey: userDefaultsKey)
    }

    func clearToken() {
        UserDefaults.standard.removeObject(forKey: userDefaultsKey)
    }
}
