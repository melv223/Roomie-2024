//
//  Roomie_2024App.swift
//  Roomie 2024
//
//  Created by Melvin Estudillo on 10/29/24.
//

import Foundation
import Swift
import SwiftUI

@main
struct Roomie_2024App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

/* ---------- PARENT CLASS Manhattan University User ------------------- */
class ManhattanUniversityUser {
     /* Creating user attributes */
    var firstName: String
    var lastName: String
    var email: String
    
    init(firstName: String, lastName: String, email: String) {  // Constructor to initialize atrributies
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
    func getFirstName() -> String { //Getter function
        return firstName
    }
    func getLastName() -> String { //Getter function
        return lastName
    }
    func getEmail() -> String { //Getter function
        return email
    }
    func setFirstName(_ firstName: String) { //Setter function
        self.firstName = firstName
    }
    func setLastName(_ lastName: String) { //Setter function
        self.lastName = lastName
    }
    func setEmail(_ email: String) { //Setter function
        self.email = email
    }
}

//User
/* ---------- CHILD CLASS Student User ------------------- */
class StudentManhattanUniversityUser: ManhattanUniversityUser {
    
    /* Creating additional student attributes */
    var room: String? // Will be assigned by staff
    var roomPreference: String
    var residenceHallPreference: String
    var phoneNumber: Int
    var creditCardNumber: Int
    var expirationDate: String
    var Cvc: Int
    //var housingStatus: String = "None" //Initially set to None
    
    // Constructor to initialize atrributies
    init(firstName: String, lastName: String, email: String, roomPreference: String, residenceHallPreference: String, phoneNumber: Int, creditCardNumber: Int, expirationDate: String, Cvc: Int) {
        self.room = nil // initially null value
        self.roomPreference = roomPreference
        self.residenceHallPreference = residenceHallPreference
        self.phoneNumber = phoneNumber
        self.creditCardNumber = creditCardNumber
        self.expirationDate = expirationDate
        self.Cvc = Cvc
        super.init(firstName: firstName, lastName: lastName, email: email)
    }

    /*
    func getPhoneNumber() -> Int { //Setter function
        return phoneNumber
    }
    func getCreditCardNumber() -> Int { //Getter function
        return creditCardNumber
    }*/
    
    func housingApplication() -> String {
        //housingStatus = "None"
        if firstName.isEmpty || lastName.isEmpty{
            return "Error putting in first or last name"
        }
        
        if email.isEmpty || !email.hasSuffix("@manhattan.edu"){
            return "Error putting in email"
        }
        
        if roomPreference.isEmpty || residenceHallPreference.isEmpty {
            return "Error putting in prefrences"
        }
        
        let paymentVerfied = PaymentSystem.paymentVer.verifyPayment(cardNumber: creditCardNumber, expirationDate: expirationDate, Cvc: Cvc)
        
        if !paymentVerfied{
            return "Error putting in payment"
        }
        
        //housingStatus = "Being Reviewed"
        return "Your application for housing has been submitted successfully. We will review your application and contact you soon."
    }
    
    func mentalHealthTrackeR() -> String {
        return "Your mental health tracker has been updated. We will review your mental health tracker and contact you soon."
    }
    
    func login() -> String {
        return "You have successfully logged in."
    }
}

//RA
/* ---------- CHILD CLASS RA Student User ------------------- */
class RAManhattanUniversityUser: StudentManhattanUniversityUser {
    /* Creating additional RA attributes */
    var hall: String
    var floor: Int
    
    // Constructor to initialize atrributi
    init(firstName: String, lastName: String, email: String, roomPreference: String, residenceHallPreference: String, phoneNumber: Int, creditCardNumber: Int, expirationDate: String, Cvc: Int, hall: String, floor: Int) {
        self.hall = hall
        self.floor = floor
        super.init(firstName: firstName, lastName: lastName, email: email, roomPreference: roomPreference, residenceHallPreference: residenceHallPreference, phoneNumber: phoneNumber, creditCardNumber: creditCardNumber, expirationDate: expirationDate, Cvc: Cvc)
    }
    
    /*
    func getFloor() -> Int { //Getter function
        return floor
    }
    func getHall() -> String { //Getter function
        return hall
    }
    func RAFunction() -> String {
        return "\(hall) \(floor)"
    }*/
    
}

//Staff
/* ---------- CHILD CLASS Staff User ------------------- */
class StaffManhattanUniversityUser: ManhattanUniversityUser {
    
    /* Creating additional staff attributes */
    var isAuthorized: Bool // Attribute which determines if this staff user is authorized to make specific decisions
    
    // Creating an array to store pending applications from students
    var pendingApplications: [StudentManhattanUniversityUser] = []
    
    // Creating a function to recieve application information and append it to the array to be reviewed
    func addApplication(_ application: StudentManhattanUniversityUser) {
        pendingApplications.append(application)
    }
    
    func nextApplication() -> StudentManhattanUniversityUser? {
        guard !pendingApplications.isEmpty else { return nil }
        return pendingApplications.removeFirst()
    }
    
    // Constructor to initialize atrributies
    init(firstName: String, lastName: String, email: String, isAuthorized: Bool ){
        self.isAuthorized = isAuthorized
        super.init(firstName: firstName, lastName: lastName, email: email)
    }
    
    func getAuthorization() -> Bool { //Getter function
        return isAuthorized
    }
    func setAuthorization(_ newAuthorization: Bool) { //Setter function
        isAuthorized = newAuthorization
    }
    
    func reviewHousingApplication() -> String {
        
        guard let application = nextApplication() else {
            return "No application to review"
        }
        
        print("Reviewing Housing Application")
        
        var approved: Bool
        print("Approve application by entering /'true' or disapprove application by entering /'false' :")
        
        if let result = readLine() {
            // Convert the input to a Bool (true/false)
            approved = (result.lowercased() == "true")
            
            if approved{
                print("Enter students room: ") // Staff enters students new room
                let room = readLine()   //read input
                application.room = room // Update student's room attribute
                //application.applicationStatus = "Approved" //Update student housing status to approved
                let studentDatabase = StudentDatabase()  // Assuming you have a database system
                studentDatabase.addStudent(application) // Add students information to database if approved
                print( "Applicated reviwed and updated") // Inform user of status
            }
            else{
                //application.applicationStatus = "Denied" //Update student housing status to denied
                print("Application denied") //Inform user of status
            }
        }
        
        return "Reviewing complete" // Return that the viewing complete
    }
    
}


/* ----------- Temporary database classes to replicate database system and run the funtionalities -------- */
class StudentDatabase {
    var students: [StudentManhattanUniversityUser] = []
    func addStudent(_ student: StudentManhattanUniversityUser) {
        students.append(student)
    }
    func fetchStudents () -> [StudentManhattanUniversityUser]{
        return students
    }
}
class RoomDatabase {
    var rooms: [String: [StudentManhattanUniversityUser]] = [:]
    func addRoom(_ room: String, _ student: StudentManhattanUniversityUser) {
        if rooms[room] == nil {
            rooms[room] = []
        }
        rooms[room]?.append(student)
    }
    func getStudentsInRoom(_ room: String) -> [StudentManhattanUniversityUser] {
        return rooms[room] ?? []  // will return empty array instead of nil
    }
}


/* ----------- Temporary payment class to replicate payment system and run the funtionalities -------- */
class PaymentSystem{
    static let paymentVer = PaymentSystem() // static property to create singleton to ensure the class can have only one object
    private init() {}    //Private Initializer
    
    func verifyPayment(cardNumber: Int, expirationDate: String, Cvc: Int) -> Bool {
        var valid: Bool = true // Creating inital boolean variable to determine if card info is correct and valid
        if String(cardNumber).count != 16{
            print("Error putting in card number") //display error to user
            valid = false //update error to true
        }
        if Cvc < 100 || Cvc > 999{
            print("Error putting in CVC") //display error to user
            valid = false //update error to true
        }
        if expirationDate.contains("/"){ //check if the formate of the experiation date is correct
            let fields = expirationDate.split(separator: "/") //check if the two fields are put in correct
            if fields.count == 2,           // If the user input the amount of fields correctly
               let month = Int(fields[0]),  // Create variable to hold month value
               let year = Int(fields[1]),   // Create variable to hold year value
               (1...12).contains(month),    // Check if the range for the month is correct
               (2024...9999).contains(year) { //Check if the range for the year is correct
            }
            else {
                print("Error in expiration date. It must be in MM/YYYY format with a valid range") //Inform user of error
                valid = false
            }
        }else{
            valid = false;
        }
        return valid
    }
}
