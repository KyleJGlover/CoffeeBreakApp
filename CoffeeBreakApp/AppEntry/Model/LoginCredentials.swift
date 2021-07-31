//
//  File.swift
//  LoginPrototype
//
//  Created by Kyle Glover on 6/25/21.
//

import Foundation

struct Credentials: Codable {
    var email: String = ""
    var password: String = ""
    
    enum CodingKeys: String, CodingKey {
    case email = "username_email"
    case password = "password"
    }
}

class Profile: ObservableObject, Codable {
    
    @Published var email: String
    @Published var profile_id: Int
    @Published var username: String
    @Published var firstName: String
    @Published var lastName: String
    @Published var description: String
    
    enum CodingKeys: String, CodingKey {
        case email
        case profile_id = "profile_id"
        case username
        case firstName = "first_name"
        case lastName = "last_name"
        case description
    }

    init(){
        self.email = ""
        self.profile_id = 0
        self.username = ""
        self.firstName = ""
        self.lastName = ""
        self.description = ""
    }
    init(profile_id:Int){
        self.email = ""
        self.profile_id = profile_id
        self.username = ""
        self.firstName = ""
        self.lastName = ""
        self.description = ""
        
        self.grabOneProfile()
    }
    required init(from decoder: Decoder) throws {
        let decodeProfile = try decoder.container(keyedBy: CodingKeys.self)
        // Profile
        email = try decodeProfile.decode(String.self, forKey: .email)
        profile_id = try decodeProfile.decode(Int.self, forKey: .profile_id)
        username = try decodeProfile.decode(String.self, forKey: .username)
        firstName = try decodeProfile.decode(String.self, forKey: .firstName)
        lastName = try decodeProfile.decode(String.self, forKey: .lastName)
        description = try decodeProfile.decode(String.self, forKey: .description)

        }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        // Profile
        try container.encode(email, forKey: .email)
        try container.encode(profile_id, forKey: .profile_id)
        try container.encode(username, forKey: .username)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(description, forKey: .description)

    }
    
    func grabOneProfile(){
        guard let url = URL(string:"http://127.0.0.1:5000/profile/\(self.profile_id)") else {
            print("Invalid URL")
            return }
        //no need to encode anything
        
        var request = URLRequest(url:url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        downloadData(request: request) { (returnedData) in
            if let data = returnedData {
                guard let profile = try? JSONDecoder().decode(Profile.self, from: data) else { return }
                DispatchQueue.main.async { [weak self] in
                    //Drink
                    self?.username = profile.username
                    self?.firstName = profile.firstName
                    self?.lastName = profile.lastName
                    self?.profile_id = profile.profile_id
                    self?.email = profile.email
                    self?.description = profile.description

                }
            } else {
                print("No data returned.")
            }
        }
    }    
}

class listProfiles: ObservableObject, Identifiable {
    
    @Published var profileList:[Profile] = []
    
    func grabListData(){
        
        guard let url = URL(string:"http://127.0.0.1:5000/friends/profile/all") else {
            print("Invalid URL")
            return }
        
        var request = URLRequest(url:url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        //request.httpBody = encoded
        
        downloadData(request: request) { (returnedData) in
            if let data = returnedData {
                guard let profileList = try? JSONDecoder().decode([Profile].self, from: data) else { return }
                DispatchQueue.main.async { [weak self] in
                    self?.profileList = profileList
                }
            } else {
                print("No data returned.")
            }

        }
    }
}

