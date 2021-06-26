//
//  SignUpView.swift
//  LoginPrototype
//
//  Created by Kyle Glover on 6/25/21.
//

import SwiftUI
import Combine

struct SignUpView: View {
    
    @State var firstName:String = ""
    @State var lastName:String = ""
    @State var userName:String = ""
    @State var email:String = ""
    @State var password1:String = ""
    @State var password2:String = ""
    @State var showPasswords = false
    @State var terms = false
    @ObservedObject var passwordChecker:PasswordChecker = PasswordChecker()
    @State var selectedDate = Date()
    
    @State var navBarHidden: Bool = true

    
    var body: some View {
        VStack{
            //title for sign up page
            HStack{
                Text("Sign Up")
                    .bold()
                    .font(.title)
                    .padding()
                Spacer()
            }
            Form {
            Section(header: Text("Personal Details")) {
                
                TextField("First Name", text: $firstName)
                    .accessibilityLabel("First Name")
                    .ignoresSafeArea(.keyboard, edges: .bottom)
                
                TextField("Last Name", text: $lastName)
                    .accessibilityLabel("Last Name")
                    .ignoresSafeArea(.keyboard, edges: .bottom)

                TextField("Display Name", text: $userName)
                    .accessibilityLabel("Display Name")
                    .ignoresSafeArea(.keyboard, edges: .bottom)
                
//                Section(header: Text("Date of Birth")) {
//                    VStack {
//                            DatePicker("Enter your birthdate", selection: $selectedDate, displayedComponents: .date)
//                                .labelsHidden()
//                                .datePickerStyle(WheelDatePickerStyle())
//                                .accessibilityLabel("Birth Date")
//                    }
//                } // end section date of birth
            } // end section Personal Information
                Section(header: Text("Login Information")) {
                    TextField("Email (Will be your login id)", text: $email)
                        .accessibilityLabel("Email")
                        .ignoresSafeArea(.keyboard, edges: .bottom)

                    Section(header: Text("Passwords (Must be greater than 8 Characters)")) {
                        HStack {
                            Spacer()
                            Button(action: {
                                self.showPasswords.toggle()
                            }) {
                                if !self.showPasswords {
                                    Text("Show Passwords")
                                } else {
                                    Text("Hide Passwords")
                                } // end if
                            } // end button show pw
                            Spacer()
                        } // end HStack
                        
                        if !self.showPasswords {
                            SecureField("Enter Password", text: $password1)
                                .accessibilityLabel("Enter Password")
                                .ignoresSafeArea(.keyboard, edges: .bottom)

                            SecureField("Re-enter Password", text: $password2)
                                .accessibilityLabel("Re-enter Password")
                                .ignoresSafeArea(.keyboard, edges: .bottom)

                        } else {
                            TextField("Enter Password", text: $password1)
                                .accessibilityLabel("Enter Password")
                                .ignoresSafeArea(.keyboard, edges: .bottom)

                            TextField("Re-Enter Password", text: $password2)
                                .accessibilityLabel("Re-enter Password")
                                .ignoresSafeArea(.keyboard, edges: .bottom)

                        } // end if show/hide pw fields
                        if !self.passwordChecker.password.isEmpty {
                            SecureLevelView(level: self.passwordChecker.level)
                        }

                    } // end section

                        Toggle(isOn: $terms) {
                            Text("Accept the terms and conditions")
                        } // end togle
                        .accessibilityLabel("Accept the terms and conditions")

                            if self.terms{
                                Button("Sign Up!"){
                                    
                               }// end button
                            }
                }
            } // end Form
        }.navigationBarTitle("")
        .navigationBarHidden(self.navBarHidden)
        .onAppear(perform: {
            self.navBarHidden = true
        })
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}




class PasswordChecker: ObservableObject {
    public let didChange = PassthroughSubject<PasswordChecker, Never>()
@Published var password: String = ""
    
    
    // {
//         didSet {
//             self.checkForPassword(password: self.password)
//         }
//     }

   var level: PasswordStrengthLevel = .none {
        didSet {
            self.didChange.send(self)
        }
    }

    func checkForPassword(password: String) {
        if password.count == 0 {
            self.level = .none
        } else if password.count < 2 {
            self.level = .weak
        } else if password.count < 6 {
            self.level = .decent
        } else {
            self.level = .strong
        }
    }
} // end class


enum PasswordStrengthLevel: Int {
    case none = 0
    case weak = 1
    case decent = 2
    case strong = 3
}

struct SecureLevelView : View {
    var level: PasswordStrengthLevel

    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 8).foregroundColor(self.getColors()[0]).frame(height: 10)
            RoundedRectangle(cornerRadius: 8).foregroundColor(self.getColors()[1]).frame(height: 10)
            RoundedRectangle(cornerRadius: 8).foregroundColor(self.getColors()[2]).frame(height: 10)
        } // end HStack
    } // end body

    func getColors() -> [Color] {
        switch self.level {
        case .none:
            return [.clear, .clear, .clear]
        case .weak:
            return [.red, .clear, .clear]
        case .decent:
            return [.red, .orange, .clear]
        case .strong:
            return [.red, .orange, .green]
        } // end switch
    } // end function getColors
} // end struct


struct SecureLevelView_Previews : PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
