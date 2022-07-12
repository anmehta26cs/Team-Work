//
//  ImageViews.swift
//  TeamFitness
//
//  Created by Ashu Mehta on 7/11/22.
//

import SwiftUI

struct LogoImage: View {
    var size: CGFloat
    
    var body: some View {
        Image("TextLogo")
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
    }
}
