//
//  HomePage.swift
//  Roomie 2024
//
//

import SwiftUI

struct HomePage: View{
    
    @State var selectedTab = 0 // Set initial page
    var body: some View{
        
        TabView(selection: $selectedTab){
        
            // Enter Profile View here
            Text("Profile Page")
                .tabItem{
                    Image(systemName: "person") // person icon
                    Text("Profile")
                }
                .tag(0) //Tab 1
            
            HousingView() //Housing view here
                .tabItem{
                    Image(systemName: "house") // house icoon
                    Text("Housing")
                }
                .tag(1) //Tab 2
            
            // Enter Mental Health here
            MentalHealthTrackerForm()
                .tabItem{
                    Image(systemName: "pencil") // pencil icon
                    Text("Tracker")
                }
                .tag(2) //Tab 3
            
            // Enter report issue here
            ReportIssueView()
                .tabItem{
                    Image(systemName: "note") // pencil icon
                    Text("Report Issue")
                }
                .tag(2) //Tab 3
            
            
        } //end tab view
        //.padding()
        .accentColor(.orange)
    } //end body
} //end struct


#Preview{
    HomePage()
}
