//
//  ContentView.swift
//  Roomie
//
//  Created by Melvin Estudillo on 10/25/24.
//newbranch

import SwiftUI


struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    @StateObject var viewmo = ContentViewViewModel()
    
    var body: some View {
        if viewmo.isSignedin , !viewmo.currentuserID.isEmpty{
            //display homepage
            HomePage()
            
        }
        else{
            HomeView()
        }
            
        
        
        }
    }

#Preview {
    ContentView()
}
