//
//  Subjects.swift
//  PublishersSubscribersAndOperators
//
//  Created by Leonardo Medeiros on 23/01/23.
//

import SwiftUI
import Combine

// Subjects are both Publisher and Subscriber
struct Subjects: View {
    //PassthroughSubject allows you to publish new values on demand
    var subject = PassthroughSubject<String, Never>()
    @StateObject var subscriber = StringSubscriber()
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            TextField("text", text: $text)
                .textFieldStyle(.roundedBorder)
            Button("Add") {
                subject.send(text)
            }
            Spacer()
            Text(subscriber.inputText)
                .onAppear {
                    subject.subscribe(subscriber)
                }
        }
    }
}

struct Subjects_Previews: PreviewProvider {
    static var previews: some View {
        Subjects()
    }
}
