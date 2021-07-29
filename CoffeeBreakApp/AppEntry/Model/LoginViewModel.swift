//
//  LoginView.swift
//  LoginPrototype
//
//  Created by Kyle Glover on 6/25/21.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var credentials:Credentials = Credentials()
    @Published var showProgressView:Bool = false
    @Published var showingErrorAlert:Bool = false
    
    var loginDisabled: Bool {
        credentials.email.isEmpty || credentials.password.isEmpty
    }
    
    func login(authentication:Authentication, userProfile:Profile) {
        showProgressView = true
            APIService().login(credentials:credentials) { result in
                switch result {
                    case .success(let dataProfile):
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){ [weak self] in
                            print(dataProfile)
                            self?.showProgressView = false
                            userProfile.email = dataProfile.email
                            userProfile.username = dataProfile.username
                            userProfile.firstName = dataProfile.firstName
                            userProfile.lastName = dataProfile.lastName
                            userProfile.profile_id = dataProfile.profile_id
                            
                            authentication.updateValidation(success: true)
                            
                            self?.credentials.email = ""
                            self?.credentials.password = ""
                        }

                    case .failure(let error):
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
                            self?.showProgressView = false
                            self?.showingErrorAlert = true
                            self?.credentials.email = ""
                            self?.credentials.password = ""
                        }
                        print(error.localizedDescription)
                    }
            }
        
    }
}
