//
//  AppViewModel.swift
//  TeamFitness
//
//  Created by Ashu Mehta on 7/11/22.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AppViewModel: ObservableObject {
    let auth  = Auth.auth()
    
    
    @Published var signedIn = false
    @Published var signedUp = false
    @Published var user : User = User(id: "", firstName: "", lastName: "")
    
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func fetchUserData() {
        let db = Firestore.firestore()
        let docRef = db.collection("users").document(self.user.id)
        // TODO: complete this by following https://firebase.google.com/docs/firestore/query-data/get-data
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
//                print("Document data: \(dataDescription)")
//            } else {
//                print("Document does not exist")
//            }
//        }
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result,error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                if let result = result {
                    self?.user.id = result.user.uid

                }
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
                self?.user.id = result.user.uid
                db.collection("users").document(result.user.uid).setData(["firstName" : firstName,
                                                              "lastName" : lastName]) { err in
                    if let err = err {
                        print("Error writing document: \(err)")
                    }
                    
                }
                DispatchQueue.main.async {
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


