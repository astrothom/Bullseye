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
  @State var target = Int.random(in: 1...100)
  @State var score = 0
  @State var round = 1
  
  var body: some View {
    VStack {
      Spacer()
      
      // Target row
      HStack {
        Text("Put the bullseye as close as you can to:")
        Text("\(self.target)")
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
        return Alert(title: Text("\(alertTitle())"),
                     message: Text(
                      "The slider's value is: \(self.sliderValueRounded()).\n" +
                      "You scored \(self.pointsForCurrentRound()) points this round."
          ), dismissButton: .default(Text("Awesome!")) {
            self.score += self.pointsForCurrentRound()
            self.target = Int.random(in: 1...100)
            self.round += 1
          })
      }
      Spacer()
      
      // Score row
      HStack {
        Button(action: {
          self.startNewGame()
        }) {
          Text("Start over")
        }
        Spacer()
        Text("Score:")
        Text("\(self.score)")
        Spacer()
        Text("Round:")
        Text("\(self.round)")
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
  
  func amountOff() -> Int {
    return abs(self.target - self.sliderValueRounded())
  }
  
  func pointsForCurrentRound() -> Int {
    
    let maximumScore = 100
    let difference = amountOff()
    let bonus: Int
    
    switch difference {
    case 0:
      bonus = 100
    case 1:
      bonus = 50
    default:
      bonus = 0
    }
    return maximumScore - difference + bonus
  }
  
  func alertTitle() -> String {
    
    let title: String
    let difference =  amountOff()
    
    switch difference {
    case 0:
      title = "Perfect!"
    case 1...4:
      title = "You almost had it!"
    case 5...10:
      title = "Not bad."
    default:
      title = "Are you even trying?"
    }
    return title
  }
  
  func startNewGame() {
    score = 0
    round = 1
    sliderValue = 50.0
    target = Int.random(in: 1...100)
  }
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().previewLayout(.fixed(width: 812, height: 375))
  }
}





