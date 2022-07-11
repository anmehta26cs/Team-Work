//
//  RegistrationView.swfit.swift
//  TeamFitness
//
//  Created by Ashu Mehta on 7/10/22.
//

import SwiftUI

struct RegistrationView: View {
    var body: some View {
        ZStack {
            Color("BlueColor")
                .edgesIgnoringSafeArea(.all)
            LoginBigBoldText(text: "Register")
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
