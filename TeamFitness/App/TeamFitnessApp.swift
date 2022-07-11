//
//  TeamFitnessApp.swift
//  TeamFitness
//
//  Created by Ashu Mehta on 7/10/22.
//
enum UserState {
    case login
    case authenticated
}

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct TeamFitnessApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            let appViewModel: AppViewModel = AppViewModel()
//            ContentView()
//                .environmentObject(appViewModel)
            RegistrationView()
        }
    }
}
