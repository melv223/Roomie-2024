//
//  Home-Screen.swift
//  Roomie
//
//  Created by Melvin Estudillo on 10/25/24.
//

import SwiftUI

struct Load_Screen: View {
    
    var body: some View {
        VStack {
            
            Text("Roomie")
                .font(.system(size: 70))
                .fontWeight(.black)
                .foregroundStyle(
                    LinearGradient(colors: [.purple,.orange,.red], startPoint: .topLeading,
                                   endPoint: .bottomTrailing ))
        }
        .padding()
    }
}

#Preview {
    Load_Screen()
}
