//
//  HomeView.swift
//  Roomie
//
//  Created by Melvin Estudillo on 10/25/24.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    
    @State var email : String = ""
    @State var password : String = ""
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundStyle(.colorPurple)
                .offset(CGSize(width: 0, height: -70))
            
            Text("Roomie")
                .font(.system(size: 70))
                .fontWeight(.black)
                .foregroundStyle(
                    LinearGradient(colors: [.purple,.orange,.red], startPoint: .topLeading,
                                   endPoint: .bottomTrailing ))
            
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        VStack(spacing: 20) {
            
           Spacer()
            
            Button(action:{
                isOnboardingViewActive = true
            }){
                Text("Restart")
                    .font(.largeTitle)
                    .foregroundStyle(.black)
            }
            
            
            Form {
                TextField("Email", text: $email)
                SecureField("Password", text: $password)
                HStack {
                    Button(action:{
                        isOnboardingViewActive = false
                    })
                    {
                        Text("Create an account")
                            .foregroundStyle(.black)
                    }
                    
                    Spacer()
                    Button(action:{
                        isOnboardingViewActive = false
                    })
                    {
                        Text("Forgot Password?")
                            .foregroundStyle(.black)
                    }
                }
            }

            
        }
        Spacer()
    }
}

#Preview {
    HomeView()
}
