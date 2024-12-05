//
//  ContentView.swift
//  Roomie
//
//  Created by Melvin Estudillo on 10/25/24.
//

import SwiftUI


struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    var body: some View {
        VStack {
            
            if isOnboardingViewActive {
                OnboardingView()
            }
            else{
                HomeView()
            }
        }
        
        }
    }

#Preview {
    ContentView()
}
