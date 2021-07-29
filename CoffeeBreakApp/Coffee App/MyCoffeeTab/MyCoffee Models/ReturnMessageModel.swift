//
//  File.swift
//  CoffeeBreakApp
//
//  Created by Kyle Glover on 7/28/21.
//

import Foundation

class Message: ObservableObject, Codable {
    @Published var message: String
    
    enum CodingKeys:String, CodingKey {
        case message
    }
    
    init(){
        self.message = ""
    }
    
    required init(from decoder: Decoder) throws {
        let decodeMessage = try decoder.container(keyedBy: CodingKeys.self)
        message = try decodeMessage.decode(String.self, forKey: .message)

    
        }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(message, forKey: .message)
    }
}
