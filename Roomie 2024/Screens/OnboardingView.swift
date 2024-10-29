//
//  OnboardingView.swift
//  Roomie
//
//  Created by Melvin Estudillo on 10/25/24.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    var body: some View {
        VStack(spacing:20) {
            Text("Welcome to Roomie!")
                .font(.largeTitle)
            Button(action: {
                isOnboardingViewActive = false
            }){
                Text("Get Started")
            }
        } // End of VStack
        
    }
}

#Preview {
    OnboardingView()
}
