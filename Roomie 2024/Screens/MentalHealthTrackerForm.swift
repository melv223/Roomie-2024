//  ViewController.swift
//  MentalHealthTracker
//
//  Created by Corinne Simeone
//
//reversion
import SwiftUI
struct MentalHealthTrackerForm: View {
    @State private var firstName = ""
    @State private var scoreText = ""
    @State private var showingAlert: Bool = false
    @State private var showingConfirmationAlert: Bool = false
    @State private var alertMessage: String = "Submit your mental health score"
    @FocusState private var focusedField: FormField?
    enum FormField {
        case firstName, score
    }
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationStack {
            Form {
                // user info
                Section(header: Text("Personal Info").fontWeight(.heavy)) {
                    // First Name Field
                    TextField("Enter your first name", text: $firstName)
                        .padding(10)
                        .background(Color(.systemGray6))
                        .cornerRadius(5)
                        .disableAutocorrection(true)
                        .submitLabel(.next)
                        .focused($focusedField, equals: .firstName)
                        .onSubmit {
                            determineField()
                        }
                }
                
                // submission
                Section(header: Text("Mental Health Score").fontWeight(.heavy)) {
                    TextField("Enter a score from 1 to 10", text: $scoreText)
                        .padding(10)
                        .background(Color(.systemGray6))
                        .cornerRadius(5)
                        .keyboardType(.numberPad)
                        .submitLabel(.done)
                        .focused($focusedField, equals: .score)
                        .onSubmit {
                            validateScore()
                        }
                }
                
                // submit button
                Button(action: {
                    showingConfirmationAlert = true
                }, label: {
                    Text("Submit Score")
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(.borderedProminent)
                .tint(.green)
                .alert("Are you sure?", isPresented: $showingConfirmationAlert) {
                    Button("Cancel", role: .cancel) {}
                    Button("Submit") {
                        validateScore()
                    }
                } message: {
                    Text("You’ve entered \(scoreText). Are you sure you want to submit?")
                }
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("Submission Status"),
                        message: Text(alertMessage),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
            .navigationBarTitle("Mental Health Tracker")
            .onAppear { focusedField = .firstName }
            .scrollContentBackground(.hidden)
            .background(Gradient(colors: [.indigo, .purple]))
            .padding(.bottom, 20)
        }
    }
    //if enter is clicked go to different field
    private func determineField() {
        switch focusedField {
            case .firstName:
                focusedField = .score
            case .score:
                focusedField = nil
            default:
                focusedField = nil
        }
    }
    // validating score 1-10
    private func validateScore() {
        //empty field
        if scoreText.trimmingCharacters(in: .whitespaces).isEmpty {
            alertMessage = "The Score field can not be empty. Enter a number 1-10."
            showingAlert = true
            return
        }
        guard let score = Int(scoreText), (1...10).contains(score) else {
            alertMessage = "Invalid score. Please enter a number between 1 and 10."
            showingAlert = true
            return
        }
        alertMessage = score <= 3
            ? "Your score is \(score). Wellness Check is required. RA will be notified."
            : "Your score is \(score). You’re doing great!"
        showingAlert = true
    }
}
#Preview {
    MentalHealthTrackerForm()
}
