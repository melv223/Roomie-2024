//
//  HousingApplicationForm.swift
//  Roomie 2024
//
//

import SwiftUI


struct HousingApplicationForm: View {
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    // Create variables to store user input values
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var roomPreference = ""
    @State var residenceHallPreference = ""
    @State var phoneNumber = ""
    @State var creditCardNumber = ""
    @State var expirationDate = ""
    @State var cvc = ""
    @State var applicationStatus = ""
    @State var showingAlert: Bool = false
    @State var ApplicationAlert: String = ""
   
    
    @FocusState private var focusedField: FormField?
        enum FormField{
        case firstName,lastName,email,phoneNumber,roomPreference,residenceHallPreference,creditCardNumber,expirationDate,cvc
        }
    
    var body: some View {
        
        NavigationStack{
            
                    Form {
                        
                        Section(header: Text("Personal Info")){
                            // create first name field
                            TextField("Enter first name", text: $firstName)
                                .padding(10)
                                .background(Color(.systemGray6))
                                .cornerRadius(5)
                                .disableAutocorrection(true)
                                .submitLabel(.next)
                                .focused($focusedField, equals: .firstName)
                                .onSubmit{
                                    determineFeild()
                                }
                            
                            // create last name field
                            TextField("Enter last name", text: $lastName)
                                .padding(10)
                                .background(Color(.systemGray6))
                                .cornerRadius(5)
                                .disableAutocorrection(true)
                                .submitLabel(.next)
                                .focused($focusedField, equals: .lastName)
                                .onSubmit{
                                    determineFeild()
                                }
                            
                            // create email field
                            TextField("Enter email", text: $email)
                                .padding (10)
                                .background (Color(.systemGray6))
                                .cornerRadius (5)
                                .keyboardType(.emailAddress) // keyboard type
                                .autocapitalization(.none)
                                .disableAutocorrection (true)
                                .submitLabel(.next)
                                .focused($focusedField, equals: .email)
                                .onSubmit{
                                    determineFeild()
                                }
                            
                            // create phone number field
                            TextField("Enter phone number", text: $phoneNumber)
                                .keyboardType(.numberPad)
                                .padding(10)
                                .background(Color(.systemGray6))
                                .cornerRadius(5)
                                .submitLabel(.next)
                                .focused($focusedField, equals: .phoneNumber)
                                .onSubmit{
                                    determineFeild()
                                }
                        }
                        
                        Section(header: Text("Preferences (Not guarenteed)")){
                            // create roomPreference field
                            TextField("Enter room preference", text: $roomPreference)
                                .padding(10)
                                .background(Color(.systemGray6))
                                .cornerRadius(5)
                                .disableAutocorrection(true)
                                .submitLabel(.next)
                                .focused($focusedField, equals: .roomPreference)
                                .onSubmit{
                                    determineFeild()
                                }
                            
                            // create residence hall preference field
                            TextField("Enter residence hall preference", text: $residenceHallPreference)
                                .padding(10)
                                .background(Color(.systemGray6))
                                .cornerRadius(5)
                                .disableAutocorrection(true)
                                .submitLabel(.next)
                                .focused($focusedField, equals: .residenceHallPreference)
                                .onSubmit{
                                    determineFeild()
                                }
                        }
                        
                        Section(header: Text("Payment Info")){
                            // create credit card field
                            TextField("Enter credit card number", text: $creditCardNumber)
                                .keyboardType(.numberPad)
                                .padding(10)
                                .background(Color(.systemGray6))
                                .cornerRadius(5)
                                .submitLabel(.next)
                                .focused($focusedField, equals: .creditCardNumber)
                                .onSubmit{
                                    determineFeild()
                                }
                            
                            // create expiration date field
                            TextField("Enter expiration date", text: $expirationDate)
                                .keyboardType(.numberPad)
                                .padding(10)
                                .background(Color(.systemGray6))
                                .cornerRadius(5)
                                .submitLabel(.next)
                                .focused($focusedField, equals: .expirationDate)
                                .onSubmit{
                                    determineFeild()
                                }
                            
                            // create CVC field
                            TextField("Enter CVC", text: $cvc)
                                .keyboardType(.numberPad)
                                .padding(10)
                                .background(Color(.systemGray6))
                                .cornerRadius(5)
                                .submitLabel(.done)
                                .focused($focusedField, equals: .cvc)
                                .onSubmit{
                                    determineFeild()
                                }
                        }
                        
                        Button(action: {
                            showingAlert = true //Set value to true to represent user clicking on button
                            
                            //Changing string values to int
                            let phoneNumberInt = Int(phoneNumber) ?? 0
                            let creditCardNumberInt = Int(creditCardNumber) ?? 0
                            let cvcInt = Int(cvc) ?? 0
                            
                            //Update Student User information with entered information
                            let student = StudentManhattanUniversityUser(firstName: firstName, lastName: lastName, email: email, roomPreference: roomPreference, residenceHallPreference: residenceHallPreference, phoneNumber: phoneNumberInt, creditCardNumber: creditCardNumberInt, expirationDate: expirationDate, Cvc: cvcInt)
                            
                            //Appy housing function
                            ApplicationAlert = student.housingApplication()
                            
                            //If application if successful send the application to Admin staff user to review
                            if ApplicationAlert.contains("successfully"){
                                let staff = StaffManhattanUniversityUser(firstName: "Admin", lastName: "Staff", email: "admin@manhattan.edu", isAuthorized: true)
                                staff.addApplication(student)
                            }
                            
                        }, label: {
                            Text("Submit Form")
                        })
                        .alert(isPresented: $showingAlert){
                            Alert(title: Text("Form Message"),
                                  message: Text(ApplicationAlert),
                                  dismissButton: .default(Text("OK")))
                        }
                    } // end of form
        
            .navigationBarTitle("Housing Application")
            
            .onAppear{focusedField = .firstName}
            .scrollContentBackground(.hidden)
            .background(Color.green)
        } //end of navigation stack
    } // end of body
    
    // When the user selects a field to enter information into, the next values should be as followed
    func determineFeild(){
        switch focusedField{
            case .firstName:
                focusedField = .lastName
            case .lastName:
                focusedField = .email
            case .email:
                focusedField = .phoneNumber
            case .phoneNumber:
                focusedField = .roomPreference
            case .roomPreference:
                focusedField = .residenceHallPreference
            case .residenceHallPreference:
                focusedField = .creditCardNumber
            case .creditCardNumber:
                focusedField = .expirationDate
            case .expirationDate:
                focusedField = .cvc
            case .cvc:
                focusedField = nil
            default:
                focusedField = nil
        }
    }
    
}

#Preview {
    HousingApplicationForm()
}
