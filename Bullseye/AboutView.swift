//
//  AboutView.swift
//  Bullseye
//
//  Created by Thomas Pelfrene on 23/10/2019.
//  Copyright © 2019 Thomas Pelfrene. All rights reserved.
//

import SwiftUI

struct AboutView: View {

  let backgroundColor = Color(red: 255.0 / 255.0, green: 214.0 / 255.0, blue: 179.0 / 255.0)
  
  struct AboutHeadingStyle: ViewModifier {
    func body(content: Content) -> some View {
      content
        .modifier(TextColor())
        .font(Font.custom("Arial Rounded MT Bold", size: 30))
        .padding(.top, 20)
        .padding(.bottom, 20)
    }
  }
  
  struct AboutBodyStyle: ViewModifier {
    func body(content: Content) -> some View {
      content
        .modifier(TextColor())
        .font(Font.custom("Arial Rounded MT Bold", size: 16))
        .padding(.leading, 60)
        .padding(.trailing, 60)
        .padding(.bottom, 20)
    }
  }
  
  struct TextColor: ViewModifier {
    func body(content: Content) -> some View {
      content
        .foregroundColor(Color.black)
    }
  }
  
  var body: some View {
    VStack {
      Text("🎯 Bullseye 🎯").modifier(AboutHeadingStyle())
      Text("This is Bullseye, the game where you can win points and earn fame by dragging a slider.").modifier(AboutBodyStyle())
      Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score.").modifier(AboutBodyStyle())
      Text("Enjoy!").modifier(AboutBodyStyle())
    }
  .navigationBarTitle("About title")
  .background(backgroundColor)
  }
}

struct AboutView_Previews: PreviewProvider {
  static var previews: some View {
    AboutView().previewLayout(.fixed(width: 812, height: 375))
  }
}
