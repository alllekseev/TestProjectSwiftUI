//
//  ContentView.swift
//  TestProjectSwiftUI
//
//  Created by Олег Алексеев on 14.09.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink("Show News View") {
                    NewsTable()
                }
            }
            .navigationTitle("Main Page")
        }
    }
}

#Preview {
    ContentView()
}
