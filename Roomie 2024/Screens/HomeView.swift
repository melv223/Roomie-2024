//
//  HomeView.swift
//  Roomie
//
//  Created by Melvin Estudillo on 10/25/24.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    
    @StateObject var userd = loginviewmmodel()
    
    var body: some View {
        
        
        NavigationView {
            VStack() {
                headerview(ucolor: .colorPurple, title: "Roomie")
                Button(action:{
                    isOnboardingViewActive = true
                }){
                    Text("Restart")
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                }
                
                
                Form {
                    TextField("Email", text: $userd.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    SecureField("Password", text: $userd.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    Button{
                        //try to login
                        userd.login()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.blue)
                            
                            Text("Login")
                                .font(.title3)
                                .foregroundStyle(.white)
                        }
                    }
                        
                }
                HStack {
                    NavigationLink("Create an account", destination: RegistrationView())
                    
                    .padding()
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
