//
//  TestView.swift
//  Scrumdinger
//
//  Created by Xiang Yan on 2023/1/24.
//

import Foundation
import SwiftUI

//@main
struct TestApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }
    }
}

struct ContentView: View {
    @State private var linkClicked = false
    @State private var isActive = true

    var body: some View {
        NavigationView {
            VStack {
//                NavigationLink(destination: NewView(linkClicked: linkClicked)) {
////                               isActive: $linkClicked) {
//                    Text("Click here")
//                }.onTapGesture {
//                    self.linkClicked = true
//                }

                NavigationLink(destination: NewView(linkClicked: linkClicked),
                               isActive: $isActive) {
                    Button(action: {
                        self.isActive = true
                        self.linkClicked = true
                        print("isActive = \(isActive)")
                    }) {
                        Text("Click here")
                    }
                }
                Text("Link clicked: \(linkClicked ? "Yes" : "No")")
            }
        }
    }
}


struct NewView: View {
    @State var linkClicked: Bool

    var body: some View {
        Text("You navigated to the new view and the linkClicked value is: \(linkClicked ? "Yes" : "No")")
    }
}

struct TestPreviews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
