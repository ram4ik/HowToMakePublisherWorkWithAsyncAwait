//
//  ContentView.swift
//  HowToMakePublisherWorkWithAsyncAwait
//
//  Created by ramil on 17.02.2022.
//

import SwiftUI
import Combine

let formatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .spellOut
    return formatter
}()

var numberPublisher = Timer.publish(every: 1, on: .main, in: .common)
    .autoconnect()
    .map { _ in Int.random(in: 0...100) }
    .map { number in formatter.string(for: number) }

struct ContentView: View {
    @State var number: String = ""
    
    var body: some View {
        Text("Number: " + number)
            .font(.headline)
            .onReceive(numberPublisher) { newNumber in
                number = newNumber ?? ""
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
