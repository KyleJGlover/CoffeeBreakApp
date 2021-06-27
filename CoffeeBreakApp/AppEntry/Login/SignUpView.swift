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
    
    @State private var showingSuccessAlert = false

    @State private var showingErrorAlert = false
    
    
    @State var navBarHidden: Bool = true

    
    var body: some View {
        VStack{
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
                                        if password1 == password2 {
                                            clearSignUp(firstName: firstName, lastName: lastName, userName: userName, email: email, password1: password1, password2: password2, showPasswords: showPasswords, terms: terms)
                                            self.showingSuccessAlert = true
                                        }
                                        else{
                                            
                                            password1 = ""
                                            password2 = ""
                                            
                                            showingErrorAlert = true
                                        }
                               }// end button
                                .alert(isPresented: $showingErrorAlert, content: {
                                    Alert(
                                        title: Text("Warning"),
                                        message: Text("Passwords don't match. Please try again!"),
                                        dismissButton: .default(Text("Got it!"))
                                    )
                                })
                            }
                    
                    
                }
                if showingSuccessAlert{
                    Text("Success in creating new Profile!")
                        .font(.title)
                }
            } // end Form
        }.navigationBarTitle("Sign Up")
    }
    
    func clearSignUp(firstName:String, lastName:String, userName:String, email:String, password1:String, password2:String, showPasswords:Bool, terms:Bool){
        
        self.firstName = ""
        self.lastName = ""
        self.userName = ""
        self.email = ""
        self.password1 = ""
        self.password2 = ""
        self.showPasswords = false
        self.terms = false
                
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}







