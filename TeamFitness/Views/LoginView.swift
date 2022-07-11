//
//  LoginView.swift
//  TeamFitness
//
//  Created by Ashu Mehta on 7/10/22.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class AppViewModel: ObservableObject {
    let auth  = Auth.auth()
    
    
    @Published var signedIn = false
    @Published var signedUp = false
    @Published var firstName = ""
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
//    var fullName: String {
//        return auth.currentUser?.displayName ?? "Friend"
//    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result,error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                
                self?.signedIn = true
                
            }
        }
    }
    
    func signUp(email: String, password: String, firstName: String, lastName: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                print("Error with create user: \(String(describing: error))")
                return
            }
            
            // Success
            
            if let result = result {
                let db = Firestore.firestore()
                let uid = result.user.uid
                db.collection("users").document(uid).setData(["firstName" : firstName,
                                                              "lastName" : lastName]) { err in
                    if let err = err {
                        print("Error writing document: \(err)")
                    }
                    
                }
                DispatchQueue.main.async {
                    self?.firstName = firstName
                    self?.signedUp = true
                }
            }
            
            
        }
    }
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
    }
}

struct UnauthView: View {
    @State var isLogInPresented: Bool = true
    
    var body: some View {
        if isLogInPresented {
            LoginView(isLogInPresented: $isLogInPresented)
        } else {
            SignUpView(isLogInPresented: $isLogInPresented)
        }
    }
    
}

struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""
    @Binding var isLogInPresented: Bool
    @FocusState private var nameIsFocused: Bool
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
                            isLogInPresented = false
                        },
                        label: {
                            LoginBodyText(text: "Create Account")
                                .padding()
                        })
                }
                Spacer()
            }
            VStack(alignment: .center, spacing: 15) {
                Image("TextLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                TextField("Email Address", text: $username)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .background(Color("TextInputBackgroundColor"))
                    .cornerRadius(10)
                    .shadow(color: Color("BlueColor").opacity(0.2), radius: 10, x: 10, y: 10)
                    .padding(.horizontal)
                SecureField("Password", text: $password)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .background(Color("TextInputBackgroundColor"))
                    .cornerRadius(10)
                    .shadow(color: Color("BlueColor").opacity(0.2), radius: 10, x: 10, y: 10)
                    .focused($nameIsFocused)
                    .padding(.horizontal)
                Button(action: {
                    
                    guard !username.isEmpty, !password.isEmpty else {
                        return
                    }
                    nameIsFocused = false
                    appViewModel.signIn(email: username, password: password)
                }) {
                    ButtonText(text: "Sign In")
                }
                .shadow(color: Color("AccentColor").opacity(0.2), radius: 10, x: 10, y: 10)
            }
        }
        
    }
}

struct SignUpView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var firstName: String = ""
    @State var lastName: String = ""
    @Binding var isLogInPresented : Bool
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
                            isLogInPresented = true
                        },
                        label: {
                            LoginBodyText(text: "Log in")
                                    .padding()
                        })
                }
                Spacer()
            }
            VStack(alignment: .center, spacing: 15) {
                Image("TextLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                TextField("First Name", text: $firstName)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .background(Color("TextInputBackgroundColor"))
                    .cornerRadius(10)
                    .shadow(color: Color("BlueColor").opacity(0.2), radius: 10, x: 10, y: 10)
                    .padding(.horizontal)
                TextField("Last Name", text: $lastName)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .background(Color("TextInputBackgroundColor"))
                    .cornerRadius(10)
                    .shadow(color: Color("BlueColor").opacity(0.2), radius: 10, x: 10, y: 10)
                    .padding(.horizontal)
                TextField("Email Address", text: $username)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .background(Color("TextInputBackgroundColor"))
                    .cornerRadius(10)
                    .shadow(color: Color("BlueColor").opacity(0.2), radius: 10, x: 10, y: 10)
                    .padding(.horizontal)
                SecureField("Password", text: $password)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .background(Color("TextInputBackgroundColor"))
                    .cornerRadius(10)
                    .shadow(color: Color("BlueColor").opacity(0.2), radius: 10, x: 10, y: 10)
                    .padding(.horizontal)
                Button(action: {
                    
                    guard !username.isEmpty, !password.isEmpty else {
                        return
                    }
                    
                    appViewModel.signUp(email: username, password: password, firstName: firstName, lastName: lastName)
                }) {
                    ButtonText(text: "Sign Up")
                }
                .shadow(color: Color("AccentColor").opacity(0.2), radius: 10, x: 10, y: 10)
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    @State static var isLogInPresented : Bool = true
    static var previews: some View {
        LoginView(isLogInPresented: $isLogInPresented)
    }
}
