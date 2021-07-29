//
//  APIService.swift
//  LoginPrototype
//
//  Created by Kyle Glover on 6/25/21.

import Foundation
import Combine



enum AuthenticationError: Error {
    case invalidCrendentials
    case custom(errorMessage: String)
}

enum RegistrationError: Error {
    case invalidInfo
    case custom(errorMessage: String)
}
    
struct LoginResponse: Codable {
    let token: String?
    let message: String?
    let success: String?

}
struct RegisterResponse: Codable {
    let message: String?
    let success: String?

}

class APIService {
    
    
    func login (credentials: Credentials,
                completion: @escaping (Result<Profile, AuthenticationError>) -> Void) {
        
        guard let url = URL(string:"http://127.0.0.1:5000/login") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        
        let body = credentials
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "No Data")))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.custom(errorMessage: "Received no HTTP Response")))
                return
            }
            
            if response.statusCode < 200 && response.statusCode > 300 {
                completion(.failure(.custom(errorMessage: "Error HTTP Status code \(response.statusCode)")))
                return
            }
            
            guard let userProfile = try? JSONDecoder().decode(Profile.self, from: data) else{
                completion(.failure(.invalidCrendentials))
                return
            }
//            DispatchQueue.main.async { [weak self] in
//                self?.userProfile.username = userProfile.username
//                self?.userProfile.email = userProfile.email
//                self?.userProfile.firstName = userProfile.firstName
//                self?.userProfile.lastName = userProfile.lastName
//                self?.userProfile.profile_id = userProfile.profile_id
//            }
            completion(.success(userProfile))
            
        }.resume()
    }
    
    
    func register (newProfile: RegistrationProfile,
                completion: @escaping (Result<String,RegistrationError>) -> Void) {
        
        guard let url = URL(string:"http://127.0.0.1:5000/signUp") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        
        let body = newProfile
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "No Data")))
                return
            }
            
            guard let registerResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else{
                completion(.failure(.invalidInfo))
                return
            }
            
            guard let message = registerResponse.token else {
                completion(.failure(.invalidInfo))
                return
            }
            
            completion(.success(message))
            
        }.resume()
    }

}
