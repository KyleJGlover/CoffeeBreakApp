//
//  APIService.swift
//  LoginPrototype
//
//  Created by Kyle Glover on 6/25/21.

import Foundation

class APIService {
    static let shared = APIService()
    enum APIError: Error {
        case error
    }
    
    func login (credentials: Credentials,
                completion: @escaping (Result<Bool,APIError>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if credentials.password == "password" {
                completion(.success(true))
            }   else {
                completion(.failure(APIError.error))
            }
        }
    }
}
