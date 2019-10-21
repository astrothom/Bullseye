//
//  ContentView.swift
//  Bullseye
//
//  Created by Thomas Pelfrene on 21/10/2019.
//  Copyright © 2019 Thomas Pelfrene. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
  @State var alertIsVisible = false
  @State var sliderValue = 50.0
  @State var targetValue = Int.random(in: 1...100)
  
  
  var body: some View {
    VStack {
      Spacer()
      
      // Target row
      HStack {
        Text("Put the bullseye as close as you can to:")
        Text("\(self.targetValue)")
      }
      Spacer()
      
      // Slider row
      HStack {
        Text("1")
        Slider(value: $sliderValue, in: 1...100)
        Text("100")
      }
      Spacer()
      
      // Button row
      Button(action: {
        print("Button pressed!")
        self.alertIsVisible = true
      }) {
        Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
      }
      .alert(isPresented: $alertIsVisible) { () -> Alert in
        return Alert(title: Text("Hello there!"),
                     message: Text(
                      "The slider's value is: \(self.sliderValueRounded()).\n" +
                      "You scored \(self.pointsForCurrentRound()) points this round."
          ), dismissButton: .default(Text("Awesome!")))
      }
      Spacer()
      
      // Score row
      HStack {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
        Text("Start over")
        }
        Spacer()
        Text("Score:")
        Text("999999")
        Spacer()
        Text("Round:")
        Text("999")
        Spacer()
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
        Text("Info")
        }
      }
      .padding(.bottom, 20)
    }
  }
  
  func sliderValueRounded() -> Int {
    return Int(self.sliderValue.rounded())
  }
  
  func pointsForCurrentRound() -> Int {
    return 100 - abs(self.targetValue - self.sliderValueRounded())
  }
  
}

/*
 - first subtract the target value from the slider's value.
 - Then, if the result is a negative number, multiply it by -1 to make it a positive number.
 */

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().previewLayout(.fixed(width: 812, height: 375))
  }
}
