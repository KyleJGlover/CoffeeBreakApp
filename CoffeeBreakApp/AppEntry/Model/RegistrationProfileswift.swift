//
//  ProfileModel.swift
//  CoffeeBreakApp
//
//  Created by Kyle Glover on 7/21/21.
//

import Foundation

class RegistrationProfile: Codable {
    
    enum CodingKeys: String, CodingKey{
        case firstName = "first_name"
        case lastName = "last_name"
        case userName = "username"
        case email
        case password
    }
    
    var firstName:String
    var lastName:String
    var userName:String
    var email:String
    var password:String?
    
    init(firstName:String, lastName:String, userName: String, email:String, password:String){
        self.firstName = firstName
        self.lastName = lastName
        self.userName = userName
        self.email = email
        self.password = password
    }
    func createProfile(profile: RegistrationProfile){
        
        guard let url = URL(string:"http://127.0.0.1:5000/signUp") else {
            print("Invalid URL")
            return }
        
        var request = URLRequest(url:url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        downloadData(request: request) { (returnedData) in
            if returnedData != nil {
//                guard let userProfile = try? JSONDecoder().decode(RegistrationProfile.self, from: data) else { return print("data was not decoded") }
                DispatchQueue.main.async {
                    self.firstName = ""
                    self.lastName = ""
                    self.userName = ""
                    self.email = ""
                    self.password = ""
                }
            } else {
                print("No data returned.")
            }

        }
    }
}
    

