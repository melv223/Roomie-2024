//
//  ReportIssueView.swift
//  Roomie 2024
//

import SwiftUI

struct ReportIssueView: View {
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Report Issue")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                        .foregroundStyle(.purple)
                    
                    Image(.logo)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .padding()
                    
                    Text("Your voice matters!")
                        .font(.system(.body, design: .rounded))
                        .padding(.horizontal)
                    
                    Text("If you encounter any problems or have concerns about your experience on campus, we want to hear from you. Reporting issues helps us create a safer, more supportive, and inclusive environment for everyone. Whether it’s a facility problem, a policy concern, or something more personal, your feedback allows us to take action and make improvements.")
                        .font(.system(.body, design: .rounded))
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    // Button to navigate to the housing application form
                    NavigationLink(destination: ReportIssueForm()) {
                        Text("Report Your Issue Here")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    } // End of navigation link
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                } // End of Vstack
                //.navigationBarTitle("Housing Information", displayMode: .inline)
                .padding()
            } //End of scroll view
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Fill the screen
            .background(Gradient(colors: [.white, .green]))
            .padding(.bottom, 20)
        }
    }
}
#Preview {
    ReportIssueView()
}
