//
//  RepoortIssueForm.swift
//  Roomie 2024
//
//

import SwiftUI

struct ReportIssueForm: View {
    
    /* Custom Coloring
    let darkgreen = Color(red: 0.02, green: 0.48, blue: 0.32, opacity: 1) //custom color
 
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(darkgreen)]
    }*/
    
    @State var showingAlert: Bool = false
    @State var issue : String = ""
    @State var ApplicationAlert: String = ""
    
    var body: some View {
        
        NavigationStack{
            
            Form {
                Section{
                    Image(.logo)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .padding()
                }
                
                Section(header: Text("Describe The Issue ").fontWeight(.heavy)){
                    // create issue field
                    TextField("Description", text: $issue)
                        .padding(10)
                        .background(Color(.systemGray6))
                        .cornerRadius(5)
                        .disableAutocorrection(true)
                    
                    Button(action: {
                        showingAlert = true //Set value to true to represent user clicking on button
                        // send info to staff member
                        let staff = StaffManhattanUniversityUser(firstName: "Admin", lastName: "Staff", email: "admin@manhattan.edu", isAuthorized: true)
                        ApplicationAlert = staff.addIssue(issue)
                    }, label: {
                        Text("Submit Form")
                    })
                    .alert(isPresented: $showingAlert){
                        Alert(title: Text("Form Message"),
                              message: Text(ApplicationAlert),
                              dismissButton: .default(Text("OK")))
                    }
                } // end of form
                .navigationBarTitle("Report Issue") //title page
                .scrollContentBackground(.hidden)
            } //end of navigation stack
        } // end of body
    }
}

#Preview {
    ReportIssueForm()
}
