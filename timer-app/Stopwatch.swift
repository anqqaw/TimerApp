//
//  Stopwatch.swift
//  timer-app
//
//  Created by Aarni on 8.11.2022.
//

import Foundation

enum stopWatchMode {
    case running
    case stopped
    case reset
    case lap
}

class Stopwatch: ObservableObject {
    @Published var secondsElapsed = 0.0
    @Published var mode: stopWatchMode = .stopped

    var timer = Timer()

    func start() {
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.secondsElapsed += 0.1
        }
    }

    func stop() {
        timer.invalidate()
        mode = .stopped
    }
    
    func reset() {
        secondsElapsed = 0
        mode = .reset
    }
    
    func lap() {
        // list which shows laps
        // maybe use cowsAndBulls storedresult
    }
}
