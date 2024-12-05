//
//  RegistrationView.swift
//  Roomie 2024
//
//  Created by Melvin Estudillo on 12/1/24.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var  viewModel = RegisterViewModel()
    var body: some View {
        headerview(ucolor: .white,title: "Register")
        Form {
            TextField("Full Name", text: $viewModel.name)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocorrectionDisabled()
            TextField("Email Address", text: $viewModel.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(.none)
                .autocorrectionDisabled()
            
            
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(DefaultTextFieldStyle())
            Button{
                //try to login
                viewModel.register()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                    
                    Text("Register")
                        .font(.title3)
                        .foregroundStyle(.white)
                }
            }
            .padding()
                
        }
    }
}

#Preview {
    RegistrationView()
}
