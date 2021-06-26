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
}
