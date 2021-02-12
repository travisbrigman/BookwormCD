//
//  AnyViewTypeErasure.swift
//  Bookworm
//
//  Created by Travis Brigman on 2/12/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import SwiftUI

struct AnyViewTypeErasure: View {

    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
        if sizeClass == .compact {
            return AnyView(VStack {
                Text("Active Size Class:")
                Text("COMPACT")
            }
            .font(.largeTitle))
            } else {
                return AnyView(HStack {
                    Text("Active Size Class:")
                    Text("Regular")
                }
                .font(.largeTitle))
            }
        }
}

struct AnyViewTypeErasure_Previews: PreviewProvider {
    static var previews: some View {
        AnyViewTypeErasure()
    }
}
