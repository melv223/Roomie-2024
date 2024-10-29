//
//  HomeView.swift
//  Roomie
//
//  Created by Melvin Estudillo on 10/25/24.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    var body: some View {
        VStack(spacing: 20) {
            
                
            Button(action:{
                isOnboardingViewActive = true
            }){
                Text("Restart")
                    .font(.largeTitle)
            }
            
        }
    }
}

#Preview {
    HomeView()
}
