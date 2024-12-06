//
//  contentviewviewmodel.swift
//  Roomie 2024
//
//  Created by Melvin Estudillo on 11/29/24.
//
import FirebaseAuth
import Foundation


class ContentViewViewModel: ObservableObject {
    @Published var currentuserID: String  = ""
    
    private var handler : AuthStateDidChangeListenerHandle?
    
    
    
    init() {
            self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
                DispatchQueue.main.async {
                    self?.currentuserID = user?.uid ?? ""
                }
            }
        }
        
    
        public var  isSignedin: Bool {
            return Auth.auth().currentUser != nil
            
        }
    
}

