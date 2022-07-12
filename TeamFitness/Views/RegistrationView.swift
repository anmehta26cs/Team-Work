//
//  RegistrationView.swfit.swift
//  TeamFitness
//
//  Created by Ashu Mehta on 7/10/22.
//

import SwiftUI

struct RegistrationView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    
    var body: some View {
        ZStack {
            Color("BlueColor")
                .edgesIgnoringSafeArea(.all)
            VStack {
                LoginBigBoldText(text: "Hello")
                Button(action: {
                    appViewModel.signedUp.toggle()
                    appViewModel.signedIn.toggle()
                }) {
                    ButtonText(text: "Continue")
                }
            }
            
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
