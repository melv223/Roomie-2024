//
//  userclasses.swift
//  Roomie 2024
//
//  Created by Melvin Estudillo on 12/1/24.
//

import Foundation
import FirebaseAuth

//
//  ClassesDocument.swift
//  Classes
//
//  Created by Corinne Simeone on 11/29/24.
//
import Swift
// User
class ManhattanUniversityUser  {
    
    struct datauser: Codable {
        let id: String
        let Name: String
        let Email: String
        let joined: TimeInterval
        
    }
    
    var firstName: String
    var lastName: String
    var email: String
    
    init(firstName: String, lastName: String, email: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
    
    
    func getFirstName() -> String {
        return firstName
    }
    func getLastName() -> String {
        return lastName
    }
    func getEmail() -> String {
        return email
    }
    func setFirstName(_ firstName: String) {
        self.firstName = firstName
    }
    func setLastName(_ lastName: String) {
        self.lastName = lastName
    }
    func setEmail(_ email: String) {
        self.email = email
    }
}
//User
class StudentManhattanUniversityUser: ManhattanUniversityUser {
    var room: String
    var phoneNumber: Int
    var creditCardNumber: Int
    var expirationDate: String
    var Cvc: Int
    
    init(firstName: String, lastName: String, email: String, room: String, phoneNumber: Int, creditCardNumber: Int, expirationDate: String, Cvc: Int) {
        self.room = room
        self.phoneNumber = phoneNumber
        self.creditCardNumber = creditCardNumber
        self.expirationDate = expirationDate
        self.Cvc = Cvc
        super.init(firstName: firstName, lastName: lastName, email: email)
    }
    func getRoom() -> String {
        return room
    }
    func getPhoneNumber() -> Int {
        return phoneNumber
    }
    func getCreditCardNumber() -> Int {
        return creditCardNumber
    }
    func housingApplication() -> String {
        return "Your application for housing has been submitted. We will review your application and contact you soon."
    }
    func updateMealPlan() -> String {
        return "Your meal plan has been updated. We will review your meal plan and contact you soon."
    }
    func roommateRequestApplication() -> String {
        return "Your roommate request application has been submitted. We will review your application and contact you soon."
    }
    func mentalHealthTrackeR() -> String {
        return "Your mental health tracker has been updated. We will review your mental health tracker and contact you soon."
    }
    func login() -> String {
        return "You have successfully logged in."
    }
}
//RA
class RAManhattanUniversityUser: StudentManhattanUniversityUser {
    var hall: String
    var floor: Int
    //override?
    init(firstName: String, lastName: String, email: String, room: String, phoneNumber: Int, creditCardNumber: Int, expirationDate: String, Cvc: Int, hall: String, floor: Int) {
        self.hall = hall
        self.floor = floor
        super.init(firstName: firstName, lastName: lastName, email: email, room: room, phoneNumber: phoneNumber, creditCardNumber: creditCardNumber, expirationDate: expirationDate, Cvc: Cvc)
    }
    func getFloor() -> Int {
        return floor
    }
    func getHall() -> String {
        return hall
    }
    func RAFunction() -> String {
        return "\(hall) \(floor)"
    }
}
//Staff
class StaffManhattanUniversityUser: ManhattanUniversityUser {
    var isAuthorized: Bool
    init(firstName: String, lastName: String, email: String, isAuthorized: Bool ){
        self.isAuthorized = isAuthorized
        super.init(firstName: firstName, lastName: lastName, email: email)
    }
    func getAuthorization() -> Bool {
        return isAuthorized
    }
    func setAuthorization(_ newAuthorization: Bool) {
        isAuthorized = newAuthorization
    }
    func reviewHousingApllication() -> String {
        return "Reviewing Housing Application"
    }
    func reviewRAApplication() -> String {
        return "Reviewing RA Application"
    }
    func reviewRoommateRequest() -> String {
        return "Reviewing Roommate Request"
    }
}
// database classes
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





