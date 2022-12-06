//
//  ContentView.swift
//  timer-app
//
//  Created by Aarni on 3.11.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var stopwatch = Stopwatch()

    var body: some View {
        TabView {
            worldClock()
                .tabItem {
                    Label("World clock", systemImage:
                            "")
                }

            wake_up()
                .tabItem {
                    Label("Alarm", systemImage:
                            "")
                }

            timing()
                .tabItem {
                    Label("Stopwatch", systemImage:
                            "")
                }
            timer()
                .tabItem {
                    Label("Timer", systemImage:
                            "")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
