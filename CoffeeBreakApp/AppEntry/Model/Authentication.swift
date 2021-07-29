//
//  Authentication.swift
//  LoginPrototype
//
//  Created by Kyle Glover on 6/25/21.
//

import SwiftUI

class Authentication: ObservableObject {
    @Published var isValidated = false
    
    func updateValidation(success: Bool){
        withAnimation {
            isValidated = success
        }
    }
    
    class Token: ObservableObject, Codable {
        
        @Published var token: String
        
        enum CodingKeys: String, CodingKey {
            // Key names for API call of a drink Object
            // Attribute = "Key name of the attribute sent to the API"
            case token = "token"
        }
        init (){
            self.token = ""
        }
        
        
        func updateToken(token:String){
            self.token = token
        }
        
        
        required init(from decoder: Decoder) throws {
            let decodeCoffee = try decoder.container(keyedBy: CodingKeys.self)
            token = try decodeCoffee.decode(String.self, forKey: .token)
            }
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            //Drink
            try container.encode(token, forKey: .token)

        }
        
    }
}
