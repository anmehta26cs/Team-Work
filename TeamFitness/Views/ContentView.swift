//
//  ContentView.swift
//  TeamFitness
//
//  Created by Ashu Mehta on 7/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var appViewModel: AppViewModel
    var body: some View {
        Group {
            if appViewModel.signedIn {
                AuthView()
            } else if appViewModel.signedUp {
                RegistrationView()
            } else {
                UnauthView()
            }
        }
        .onAppear{
            appViewModel.signedIn = appViewModel.isSignedIn
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
