//
//  loginviewmmodel.swift
//  Roomie 2024
//
//  Created by Melvin Estudillo on 12/2/24.
//

import Foundation
import FirebaseAuth


class loginviewmmodel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    
    
    func login(){
        guard validate() else {
            return
        }
        // try to login
        Auth.auth().signIn(withEmail: email, password: password)
    }

    private func validate() ->Bool
    {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        print("called")
        return true
    }
    
}

