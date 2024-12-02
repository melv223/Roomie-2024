//  ViewController.swift
//  MentalHealthTracker
//
//  Created by Corinne Simeone
//

import SwiftUI

struct MentalHealthTrackerForm: View {
    @State private var scoreText: String = ""
    @State private var showingAlert: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    @FocusState private var focusedField: FormField?
    
    enum FormField {
        case score
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Mental Health Score")) {
                    TextField("Enter a score from 1 to 10", text: $scoreText)
                        .padding(10)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .keyboardType(.numberPad)
                        .submitLabel(.done)
                        .focused($focusedField, equals: .score)
                        .onSubmit {
                            validateScore()
                        }
                }
                
                // Submit Button
                Button(action: {
                    validateScore()
                }) {
                    Text("Submit Score")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .tint(.green)
            }
            .navigationBarTitle("Mental Health Tracker")
            .scrollContentBackground(.hidden)
            .background(Color.gray.opacity(0.1))
            .alert(isPresented: $showingAlert) {
                Alert(
                    title: Text(alertTitle),
                    message: Text(alertMessage),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
        .onAppear {
            focusedField = .score
        }
    }
    
    // Validate score input and show an alert
    private func validateScore() {
        guard let score = Int(scoreText), (1...10).contains(score) else {
            alertTitle = "Invalid Input"
            alertMessage = "Please enter a number between 1 and 10."
            showingAlert = true
            return
        }
        
        let concernFlag = score < 3
        alertTitle = "Mental Health Status"
        alertMessage = concernFlag
            ? "Your score is \(score). Consider talking to a counselor."
            : "Your score is \(score). Keep up the great work!"
        
        // Log the entry
        let entry: [String: Any] = [
            "email": "student@manhattan.edu",
            "date": Date(),
            "score": score,
            "concernFlag": concernFlag
        ]
        print("Entry Recorded: \(entry)")
        showingAlert = true
    }
}

#Preview {
    MentalHealthTrackerForm()
}
