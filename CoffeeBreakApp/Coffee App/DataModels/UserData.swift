//
//  UserAuth.swift
//  MyCoffee
//
//  Created by Juan Hernandez on 4/22/21.
//

import Combine

class UserData: ObservableObject {
    
    @Published var isLoggedin: Bool = false
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var displayName = ""
    @Published var zip = ""
    @Published var dob = ""
    @Published var about = ""
    @Published var id = 0
    
public       func login() {
        // login request... on success:
        self.isLoggedin = true
      } // end function login
    
    
} // end class UserAuth
