//
//  TextFieldViews.swift
//  TeamFitness
//
//  Created by Ashu Mehta on 7/11/22.
//

import SwiftUI

struct LoginTextField: View {
    var placeholderText: String
    var text: Binding<String>
    
    var body: some View {
        TextField(placeholderText, text: text)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .padding()
            .background(Color("TextInputBackgroundColor"))
            .cornerRadius(10)
            .shadow(color: Color("BlueColor").opacity(0.2), radius: 10, x: 10, y: 10)
            .padding(.horizontal)
    }
}

struct SecureLoginTextField: View {
    var placeholderText: String
    var text: Binding<String>
    
    var body: some View {
        SecureField(placeholderText, text: text)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .padding()
            .background(Color("TextInputBackgroundColor"))
            .cornerRadius(10)
            .shadow(color: Color("BlueColor").opacity(0.2), radius: 10, x: 10, y: 10)
            .padding(.horizontal)
    }
}
