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
    var room: String
    var phoneNumber: Int
    var creditCardNumber: Int
    var expirationDate: String
    var Cvc: Int
    
    // Constructor to initialize atrributies
    init(firstName: String, lastName: String, email: String, room: String, phoneNumber: Int, creditCardNumber: Int, expirationDate: String, Cvc: Int) {
        self.room = room
        self.phoneNumber = phoneNumber
        self.creditCardNumber = creditCardNumber
        self.expirationDate = expirationDate
        self.Cvc = Cvc
        super.init(firstName: firstName, lastName: lastName, email: email)
    }
    func getRoom() -> String { //Getter function
        return room
    }
    func getPhoneNumber() -> Int { //Setter function
        return phoneNumber
    }
    func getCreditCardNumber() -> Int { //Getter function
        return creditCardNumber
    }
    func housingApplication() -> String {
        return "Your application for housing has been submitted. We will review your application and contact you soon."
    }
    
    /*  Additional Functionalities
    func updateMealPlan() -> String {
        return "Your meal plan has been updated. We will review your meal plan and contact you soon."
    }
    func roommateRequestApplication() -> String {
        return "Your roommate request application has been submitted. We will review your application and contact you soon."
    }
     */
    
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
    //override?
    init(firstName: String, lastName: String, email: String, room: String, phoneNumber: Int, creditCardNumber: Int, expirationDate: String, Cvc: Int, hall: String, floor: Int) {
        self.hall = hall
        self.floor = floor
        super.init(firstName: firstName, lastName: lastName, email: email, room: room, phoneNumber: phoneNumber, creditCardNumber: creditCardNumber, expirationDate: expirationDate, Cvc: Cvc)
    }
    func getFloor() -> Int { //Getter function
        return floor
    }
    func getHall() -> String { //Getter function
        return hall
    }
    func RAFunction() -> String {
        return "\(hall) \(floor)"
    }
}
//Staff
/* ---------- CHILD CLASS Staff User ------------------- */
class StaffManhattanUniversityUser: ManhattanUniversityUser {
    
    /* Creating additional staff attributes */
    var isAuthorized: Bool // Attribute which determines if this staff user is authorized to make specific decisions
    
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
    func reviewHousingApllication() -> String {
        return "Reviewing Housing Application"
    }
    func reviewRAApplication() -> String {
        return "Reviewing RA Application"
    }
    
    /* Additional functionalities
    func reviewRoommateRequest() -> String {
        return "Reviewing Roommate Request"
    }
     */
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
