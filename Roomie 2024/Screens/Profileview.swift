//
//  Profileview.swift
//  Roomie 2024
//
//  Created by Melvin Estudillo on 11/29/24.
//

import SwiftUI

struct Profileview: View {
    var body: some View {
        let darkgreen = Color(red: 0.02, green: 0.48, blue: 0.32, opacity: 1) //custom color
        NavigationStack{
            VStack{
                Text("Profile Page")
                    .foregroundStyle(Color(.white))
            } // end of stack
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Fill the screen
            .background(Gradient(colors: [darkgreen, .green]))
            .padding(.bottom, 20)
        } //end of Navigation stack
    } // end of body
} //end of struct

#Preview {
    Profileview()
}
