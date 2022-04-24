//
//  ActualBiddingAppApp.swift
//  ActualBiddingApp WatchKit Extension
//
//  Created by Marium Mannan on 4/23/22.
//

import SwiftUI

@main
struct ActualBiddingAppApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
