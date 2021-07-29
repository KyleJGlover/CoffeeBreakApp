//
//  Login.swift
//  LoginPrototype
//
//  Created by Kyle Glover on 6/25/21.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var authentication: Authentication
    @StateObject var loginVM = LoginViewModel()
    
    @EnvironmentObject var userProfile: Profile
    
    

    
    @State var navBarHidden: Bool = true

    var body: some View {
            NavigationView {
                VStack(alignment:.center){
                    Image("CoffeeBreakIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 170, height: 200)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                        }
                        .clipShape(Circle())
                    
                    VStack{
                        Text("Coffee Break")
                            .bold()
                            .foregroundColor(Color.black)
                            .font(.largeTitle)
                            
                        
                        Text("Ready for your break?")
                            .font(.subheadline)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    Group{
                        
                        HStack{
                            Spacer()
                            Image(systemName: "envelope")
                                .foregroundColor(Color.gray)
                            TextField("Email",text:  $loginVM.credentials.email)
                            Spacer()
                               
                        }
                        HStack{
                            Spacer()
                            Image(systemName: "key")
                                .foregroundColor(Color.gray)
                            SecureField("Password",text:  $loginVM.credentials.password)
                            Spacer()
                        }
                        
                    }.frame(height:60)
                    .background(Color.white)
                    .cornerRadius(8)
                    .padding()
                    
                    if loginVM.showProgressView{
                        ProgressView()
                    }
                    
                    HStack{
                        Button("Login") {
                            loginVM.login(authentication: authentication, userProfile: userProfile)
                                
                    }.frame(width: UIScreen.main.bounds.size.width - 100)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
                    .disabled(loginVM.loginDisabled)
                        .alert(isPresented: $loginVM.showingErrorAlert, content: {
                        Alert(
                            title: Text("Warning"),
                            message: Text("Username and password combination incorrect!"),
                            dismissButton: .default(Text("Got it!"))
                        )
                    })
                    }
                    HStack {
                        Spacer()
                        NavigationLink(destination: LoginView()) {
                            Text("Forgot Password?")
                                .bold()
                                .font(.system(size: 15))
                                .padding()
                        }.background(Color.white)
                    }.padding(.top)
                    .padding(.bottom)
                    
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign Up")
                            .bold()
                            .font(.system(size: 15))
                            .padding()
                    }.background(Color.yellow)
                    
                    Spacer()
                }.background(Image("LoginBackground"))
                .disabled(loginVM.showProgressView)
                .offset(y: -75)
            }.navigationBarTitle("")
            .navigationBarHidden(self.navBarHidden)
            .onAppear(perform: {
                self.navBarHidden = true
            })
    }
}

struct LoginView_Previews: PreviewProvider {
   
    static var previews: some View {
        LoginView()
    }
}
