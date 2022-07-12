//
//  HomeView.swift
//  TeamFitness
//
//  Created by Ashu Mehta on 7/10/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                GroupBox(label: Label("Hello, Friend", systemImage: "hand.wave.fill")) {
                    Text("Content")
                }
                .padding()
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingsView(), label: {Image(systemName: "gearshape.fill")})
                }
            }
        }
    }
}



struct SettingsView: View {
    @EnvironmentObject var appViewModel : AppViewModel
    
    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                appViewModel.signOut()
            }) {
                ButtonText(text: "Sign Out")
            }
            Spacer()
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
