//
//  worldClock.swift
//  timer-app
//
//  Created by Aarni on 3.11.2022.
//

import SwiftUI

struct worldClock: View {
    @State private var clocks = [String]()
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(spacing: 100) {
                
                // make this a remove / item moving button
                //Button("Edit", action: EditButton())
                 //   .foregroundColor(.blue)

                Text("World Clock View").foregroundColor(.white).bold()

                // make this an add button
                Image(systemName: "plus")
                    .font(.title3)
                    .foregroundColor(.blue)
            }

            List {
                ForEach(clocks, id: \.self) { clock in Text(clock)
                        .listRowBackground(Color.black)
                }
                .onDelete(perform: delete)
            }
        }
        .background(Color.black)
    }

    func delete(at offsets: IndexSet) {
        clocks.remove(atOffsets: offsets)
    }

    // to add a world clock
    func openClocks() {

    }
}

struct worldClock_Previews: PreviewProvider {
    static var previews: some View {
        worldClock()
    }
}
