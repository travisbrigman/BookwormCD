//
//  CustomComponentExample.swift
//  Bookworm
//
//  Created by Travis Brigman on 2/12/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import SwiftUI

struct PushButton: View {
    let title: String
    //@Binding allows us to create a two-way connection between PushButton and whatever is using it, so that when one value changes the other does too
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title){
            self.isOn.toggle()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct CustomComponentExample: View {
    @State private var rememberMe = false
    
    var body: some View {
        VStack {
            //$ in front of the variable set to isOn binds it to is on so it changes too!
            PushButton(title: "Remember Me", isOn: $rememberMe)
            Text(rememberMe ? "ON" : "OFF" )
        }
    }
}

struct CustomComponentExample_Previews: PreviewProvider {
    static var previews: some View {
        CustomComponentExample()
    }
}
