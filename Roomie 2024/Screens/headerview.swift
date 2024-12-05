//
//  headerview.swift
//  Roomie 2024
//
//  Created by Melvin Estudillo on 11/29/24.
//

import SwiftUI

struct headerview: View {
    let ucolor : Color
    let title : String
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundStyle(ucolor)
                .offset(CGSize(width: 0, height: -70))
            
            Text(title)
                .font(.system(size: 70))
                .fontWeight(.black)
                .foregroundStyle(
                    LinearGradient(colors: [.purple,.orange,.red], startPoint: .topLeading,
                                   endPoint: .bottomTrailing ))
            
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        Spacer()
    }
}

#Preview {
    headerview(ucolor: .colorPurple, title: "Roomie")
}
