//
//  ImplementingSubscriber.swift
//  PublishersSubscribersAndOperators
//
//  Created by Leonardo Medeiros on 23/01/23.
//

import SwiftUI
import Combine

struct Subscriber: View {
    @StateObject private var subscriber = StringSubscriber()
    let publisher = ["A", "B", "C", "D", "E", "F", "G"].publisher
    
    var body: some View {
        VStack {
            Text("Counter: \(subscriber.inputText)")
        }.onAppear {
            publisher.subscribe(subscriber)
        }
    }
}

struct Subscriber_Previews: PreviewProvider {
    static var previews: some View {
        Subscriber()
    }
}
