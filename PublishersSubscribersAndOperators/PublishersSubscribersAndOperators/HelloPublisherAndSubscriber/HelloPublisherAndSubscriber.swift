//
//  HelloPublisherAndSubscriber.swift
//  PublishersSubscribersAndOperators
//
//  Created by Leonardo Medeiros on 23/01/23.
//

import SwiftUI
import UIKit
import Combine

struct HelloPublisherAndSubscriber: View {
    @State private var counter: Int = 0
    @State private var cancelable: AnyCancellable?
    let notificationCenter: NotificationCenter
    let notification: NSNotification.Name
    let publisher: NotificationCenter.Publisher
    
    init() {
        notification = Notification.Name("MyNotification")
        publisher = NotificationCenter.default.publisher(for: notification, object: nil)
        notificationCenter = NotificationCenter.default
    }
    
    var body: some View {
        VStack {
            Text("Counter: \(counter)")
            Button("Send Notification") {
                notificationCenter.post(name: notification, object: nil)
            }
        }
        .onAppear {
            self.cancelable = publisher.sink { _ in
                counter += 1
            }
        }
        .onDisappear(perform: cancelable?.cancel)
        .padding()
    }
}

struct HelloPublisherAndSubscriber_Previews: PreviewProvider {
    static var previews: some View {
        HelloPublisherAndSubscriber()
    }
}
