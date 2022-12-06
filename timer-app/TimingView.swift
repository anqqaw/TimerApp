//
//  timing.swift
//  timer-app
//
//  Created by Aarni on 3.11.2022.
//

import SwiftUI



struct Lap : Identifiable {
    let time: String
    let id = UUID()
}

struct timing: View {
    @ObservedObject var stopwatch = Stopwatch()

    var body: some View {
        VStack {
            Text("Stopwatch View")
                .foregroundColor(.orange)

            Text(String(format: "%.2f", stopwatch.secondsElapsed))
                .font(.system(size: 35))
                // .foregroundColor(.white)

            // make a file for button
            HStack(spacing: 250) {
                if stopwatch.mode == .reset || stopwatch.mode == .stopped {
                    Button(action: {stopwatch.reset()}) {
                        Text("Reset")
                            .padding(14)
                            .foregroundColor(.black)
                            .background(.gray)
                    }
                } else {
                    Button(action: {stopwatch.createLap()}) {
                        Text("Lap")
                            .padding(14)
                            .foregroundColor(.black)
                            .background(.gray)
                    }
                }

                if stopwatch.mode == .stopped || stopwatch.mode == .reset {
                    Button(action: {stopwatch.start()}) {
                        Text("Start")
                            .padding(14)
                            .foregroundColor(.black)
                            .background(.green)
                            
                    }
                } else {
                    Button(action: {stopwatch.stop()}) {
                        Text("Stop")
                            .padding(14)
                            .foregroundColor(.black)
                            .background(.red)
                    }
                }
            }
            
            List(stopwatch.laps) {
                Text($0.time)
            }
            
        }
        // .background(.black)

    }

    enum stopWatchMode {
        case running
        case stopped
        case reset
        case lap
    }

    class Stopwatch: ObservableObject {
        @Published var secondsElapsed = 0.0
        @Published var mode: stopWatchMode = .stopped
        @Published var laps: [Lap] = []

        var timer = Timer()

        func start() {
            mode = .running
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
                self.secondsElapsed += 0.01
            }
        }

        func stop() {
            timer.invalidate()
            mode = .stopped
        }

        func reset() {
            secondsElapsed = 0
            mode = .reset
            laps.removeAll()
        }

        func createLap() {
            mode = .lap
            let lap = Lap(time: String(format: "%.2f", secondsElapsed))

            laps.append(lap)
        }
    }
}

struct timing_Previews: PreviewProvider {
    static var previews: some View {
        timing()
    }
}
