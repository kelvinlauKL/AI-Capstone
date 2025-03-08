//
//  CapstoneApp.swift
//  Capstone
//
//  Created by Kelvin Lau on 2025-03-08.
//

import SwiftUI
import Sentry

@main
struct CapstoneApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
        .onAppear {
          SentrySDK.start { options in
            options.dsn = "https://802692509397b964e1d81f185ad8ada0@o4508891923021824.ingest.us.sentry.io/4508891924267008"
            options.debug = true
          }
        }
    }
  }
}
