//
//  ContentView.swift
//  Bullseye
//
//  Created by Thomas Pelfrene on 21/10/2019.
//  Copyright © 2019 Thomas Pelfrene. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
  @State var alertIsVisible: Bool = false
  @State var whosthereIsVisible: Bool = false
  
  var body: some View {
    VStack {
      VStack {
        Text("Welcome to my first app!")
          .fontWeight(.semibold)
          .foregroundColor(Color.green)
        Button(action: {
          print("Button pressed!")
          self.alertIsVisible = true
        }) {
          Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
        }
        .alert(isPresented: $alertIsVisible) { () -> Alert in
          return Alert(title: Text("Hello there!"),
                       message: Text("This is my first pop-up."),
                       dismissButton: .default(Text("Awesome!")))
        }
      }
      Button(action: {
        self.whosthereIsVisible = true
      }) {
        Text("Knock, Knock!")
      }
      .alert(isPresented: $whosthereIsVisible) { () -> Alert in
        return Alert(title: Text("Who's There?"),
                     message: Text("My funny joke."),
                     dismissButton: .default(Text("Hahahaha!")))
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
