//
//  ProfileView.swift
//  TeamFitness
//
//  Created by Ashu Mehta on 7/10/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                List {
//                    Text("Your fitness goal: \()")
//                    Text("Your height \()")
//                    Text("Your weight \()")
//                    Text("Your age \()")
                }
            }
            .navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
