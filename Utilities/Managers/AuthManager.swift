//
//  AuthManager.swift
//  FitChallenge
//
//  Created by Аветис Парсаданян on 1/8/26.
//

import Foundation

class AuthManager {
    static let shared = AuthManager()
    
    private init () {}
    
    func saveUser(email: String, name: String, role: String) {
        UserDefaults.standard.set(email, forKey: "userEmail")
        UserDefaults.standard.set(name, forKey: "userName")
        UserDefaults.standard.set(role, forKey: "userRole")
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
    }
    
    func getCurrentUser() -> (email: String, name: String, role: String)? {
        guard let email = UserDefaults.standard.string(forKey: "userEmail"),
              let name = UserDefaults.standard.string(forKey: "userName"),
              let role = UserDefaults.standard.string(forKey: "userRole") else {
            return nil
        }
        return(email, name, role)
    }
    
    func logout() {
        UserDefaults.standard.removeObject(forKey: "isLoggedIn")
        UserDefaults.standard.removeObject(forKey: "userEmail")
        UserDefaults.standard.removeObject(forKey: "userName")
        UserDefaults.standard.removeObject(forKey: "userRole")
    }
    
    func isLoggedIn() -> Bool {
        return UserDefaults.standard.bool(forKey: "isLoggedIn")
    }
}


