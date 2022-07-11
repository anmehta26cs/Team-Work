//
//  AuthView.swift
//  TeamFitness
//
//  Created by Ashu Mehta on 7/10/22.
//

import SwiftUI

struct AuthView: View {
    var body: some View {
        
        TabView {
            HomeView().tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            GroupView().tabItem {
                Image(systemName: "person.3.fill")
                Text("Groups")
            }
            ProfileView().tabItem {
                Image(systemName: "person.crop.circle.fill")
                Text("Profile")
            }
        }
        .accentColor(Color("BlueColor"))
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
