//
//  Tests.swift
//  Tests
//
//

import XCTest
@testable import Roomie_2024

final class Test: XCTestCase {

    var student: StudentManhattanUniversityUser!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        student = StudentManhattanUniversityUser(firstName: "John",lastName: "Doe", email: "johndoe@manhattan.edu" , roomPreference: "Hall", residenceHallPreference: "Chrysostom", phoneNumber: 1212121212, creditCardNumber: "1234567891012345", expirationDate: "12/2024", Cvc: 1234);
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        student = nil;
    }
    
    func test_housing_function (){
        
        student.firstName = "John";
        student.lastName = "Doe";
        student.email = "johndoe@manhattan.edu";
        student.roomPreference = "Hall";
        student.residenceHallPreference = "Chrysostom";
        student.phoneNumber = 1212121212;
        student.creditCardNumber = "1234567891012345";
        student.expirationDate = "12/2024";
        student.Cvc = 123;
        
        let result = student.housingApplication();
        XCTAssertEqual(result, "Your application for housing has been submitted successfully. We will review your application and contact you soon.")
    }
    
    /* ----------------- With errors  -------------------*/
    func test_first_name(){

        student.firstName = "";//error empty
        student.lastName = "Doe";
        student.email = "johndoe@manhattan.edu";
        student.roomPreference = "Hall";
        student.residenceHallPreference = "Chrysostom";
        student.phoneNumber = 1212121212;
        student.creditCardNumber = "1234567891012345";
        student.expirationDate = "12/2024";
        student.Cvc = 123;
            
        let result = student.housingApplication()
        XCTAssertEqual(result, "Error putting in first or last name")
    }
    
    func test_last_name(){

        student.firstName = "John";
        student.lastName = "";//error empty
        student.email = "johndoe@manhattan.edu";
        student.roomPreference = "Hall";
        student.residenceHallPreference = "Chrysostom";
        student.phoneNumber = 1212121212;
        student.creditCardNumber = "1234567891012345";
        student.expirationDate = "12/2024";
        student.Cvc = 123;
            
        let result = student.housingApplication()
        XCTAssertEqual(result, "Error putting in first or last name")
    }

    func test_email (){
        student.firstName = "John";
        student.lastName = "Doe";
        student.email = "johndoe@gmail.com";//error in email type
        student.roomPreference = "Hall";
        student.residenceHallPreference = "Chrysostom";
        student.phoneNumber = 1212121212;
        student.creditCardNumber = "1234567891012345";
        student.expirationDate = "12/2024";
        student.Cvc = 123;
        
        let result = student.housingApplication();
        XCTAssertEqual(result, "Error putting in email")
    }
    
    func test_roomPreference1() {
        student.firstName = "John";
        student.lastName = "Doe";
        student.email = "johndoe@manhattan.edu";
        student.roomPreference = ""; //error empty
        student.residenceHallPreference = "Chrysostom";
        student.creditCardNumber = "1234567891012345";
        student.phoneNumber = 1212121212;
        student.expirationDate = "12/2024";
        student.Cvc = 123;
        
        let result = student.housingApplication()
        XCTAssertEqual(result, "Error putting in preferences")
    }
    
    
    func test_roomPreference2() {
        
        student.firstName = "John";
        student.lastName = "Doe";
        student.email = "johndoe@manhattan.edu";
        student.roomPreference = "Studio"; //error not an option
        student.residenceHallPreference = "Chrysostom";
        student.phoneNumber = 1212121212;
        student.creditCardNumber = "1234567891012345";
        student.expirationDate = "12/2024";
        student.Cvc = 123;

        let result = student.housingApplication()
        XCTAssertEqual(result, "Error putting in valid room preference. Must contain either Hall, Suite, or Apartment")
    }
    
    func test_hallPreference1() {
        student.firstName = "John";
        student.lastName = "Doe";
        student.email = "johndoe@manhattan.edu";
        student.roomPreference = "Hall";
        student.residenceHallPreference = ""; //error empty
        student.phoneNumber = 1212121212;
        student.creditCardNumber = "1234567891012345";
        student.expirationDate = "12/2024";
        student.Cvc = 123;
        
        let result = student.housingApplication()
        XCTAssertEqual(result, "Error putting in preferences")
    }
    
    
    func test_hallPreference2() {
        student.firstName = "John";
        student.lastName = "Doe";
        student.email = "johndoe@manhattan.edu";
        student.roomPreference = "Hall";
        student.residenceHallPreference = "Test"; //error not an option
        student.phoneNumber = 1212121212;
        student.creditCardNumber = "1234567891012345";
        student.expirationDate = "12/2024";
        student.Cvc = 123;
        
        let result = student.housingApplication()
        XCTAssertEqual(result, "Error putting in valid residence hall preference. Must contain either Chrysostom, Horan, Lee or Jasper")
    }
    
    func test_phoneNumber (){
        
        student.firstName = "John";
        student.lastName = "Doe";
        student.email = "johndoe@manhattan.edu";
        student.roomPreference = "Hall";
        student.residenceHallPreference = "Chrysostom";
        student.phoneNumber = 12; //error range is less than
        student.creditCardNumber = "1234567891012345";
        student.expirationDate = "12/2024";
        student.Cvc = 123;
        
        let result = student.housingApplication();
        XCTAssertEqual(result, "Error putting in phone number")
    }
    
    func test_PaymentVerification1() {
        student.firstName = "John";
        student.lastName = "Doe";
        student.email = "johndoe@manhattan.edu";
        student.roomPreference = "Hall";
        student.residenceHallPreference = "Chrysostom";
        student.phoneNumber = 1212121212;
        student.creditCardNumber = "123456789101234" ; //error range is less than
        student.expirationDate = "12/2024";
        student.Cvc = 123 ;
        
        let result = student.housingApplication()
        XCTAssertEqual(result, "Error putting in payment")
    }
    
    func test_PaymentVerification2() {
        student.firstName = "John";
        student.lastName = "Doe";
        student.email = "johndoe@manhattan.edu";
        student.roomPreference = "Hall";
        student.residenceHallPreference = "Chrysostom";
        student.phoneNumber = 1212121212;
        student.creditCardNumber = "1234567891012345" ;
        student.expirationDate = "12/2023"; //error year is less than current year
        student.Cvc = 123 ;
        
        let result = student.housingApplication()
        XCTAssertEqual(result, "Error putting in payment")
    }
    
    func test_PaymentVerification3() {
        student.firstName = "John";
        student.lastName = "Doe";
        student.email = "johndoe@manhattan.edu";
        student.roomPreference = "Hall";
        student.residenceHallPreference = "Chrysostom";
        student.phoneNumber = 1212121212;
        student.creditCardNumber = "1234567891012345" ;
        student.expirationDate = "12/2024";
        student.Cvc = 12345; //error range is greater than
        
        let result = student.housingApplication()
        XCTAssertEqual(result, "Error putting in payment")
    }
    
    func test_PaymentVerification4() {
        student.firstName = "John";
        student.lastName = "Doe";
        student.email = "johndoe@manhattan.edu";
        student.roomPreference = "Hall";
        student.residenceHallPreference = "Chrysostom";
        student.phoneNumber = 1212121212;
        student.creditCardNumber = "123456789101234567" ; //error range is greater than
        student.expirationDate = "12/2024";
        student.Cvc = 123;
        
        let result = student.housingApplication()
        XCTAssertEqual(result, "Error putting in payment")
    }
    
    func test_PaymentVerification5() {
        student.firstName = "John";
        student.lastName = "Doe";
        student.email = "johndoe@manhattan.edu";
        student.roomPreference = "Hall";
        student.residenceHallPreference = "Chrysostom";
        student.phoneNumber = 1212121212;
        student.creditCardNumber = "1234567891012345" ;
        student.expirationDate = "12/2024";
        student.Cvc = 12; //error range is less than
        
        let result = student.housingApplication()
        XCTAssertEqual(result, "Error putting in payment")
    }
    
}
