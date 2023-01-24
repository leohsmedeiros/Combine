//
//  StringSubscriber.swift
//  PublishersSubscribersAndOperators
//
//  Created by Leonardo Medeiros on 23/01/23.
//

import Foundation
import Combine
import SwiftUI

class StringSubscriber: Combine.Subscriber, ObservableObject {
    @Published var counter: Int = 0
    @Published var inputText: String = ""
    typealias Input = String
    typealias Failure = Never
    
    func receive(subscription: Subscription) {
        print("Received Subscription")
        subscription.request(.max(3)) // backpressure (when you're limiting the number of itens the publisher will send)
    }

    func receive(_ input: String) -> Subscribers.Demand {
        inputText = "\(inputText) \(input)"
        counter += 1
        print("Received value")
        // will send the number defined as backpressure if you want to receive all the values set this as .unlimited
        return .none
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print("Completed")
    }
}
