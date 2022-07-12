//
//  LoginView.swift
//  TeamFitness
//
//  Created by Ashu Mehta on 7/10/22.
//

import SwiftUI


struct LoginView: View {
    @State var isLogInPresented: Bool = true
    @FocusState private var nameIsFocused: Bool
    @State var username: String = ""
    @State var password: String = ""
    @State var firstName: String = ""
    @State var lastName: String = ""
    @EnvironmentObject var appViewModel: AppViewModel
    
    var body: some View {
        ZStack {
            Color("BlueColor")
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Spacer()
                    Button(
                        action: {
                            withAnimation {
                                isLogInPresented.toggle()
                            }
                        },
                        label: {
                            LoginBodyText(text: isLogInPresented ? "Create Account" : "Log in")
                                .padding()
                        })
                }
                Spacer()
            }
            VStack(alignment: .center, spacing: 15) {
                LogoImage(size: 150)
                // is loginViewModel.$username in text: parameter correct?
                if !isLogInPresented {
                    LoginTextField(placeholderText: "First Name", text: $firstName)
                    LoginTextField(placeholderText: "First Name", text: $lastName)
                }
                LoginTextField(placeholderText: "Email Address", text: $username)
                SecureLoginTextField(placeholderText: "Password", text: $password)
                    .focused($nameIsFocused)
                Button(action: {
                    nameIsFocused = false
                    guard !username.isEmpty, !password.isEmpty else {
                        return
                    }
                    if isLogInPresented {
                        appViewModel.signIn(email: username, password: password)
                    } else {
                        appViewModel.signUp(email: username, password: password, firstName: firstName, lastName: lastName)
                    }
                    
                }) {
                    ButtonText(text: isLogInPresented ? "Sign In" : "Sign Up")
                }
                .shadow(color: Color("AccentColor").opacity(0.2), radius: 10, x: 10, y: 10)
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    @State static var isLogInPresented : Bool = true
    static var previews: some View {
        LoginView()
    }
}
