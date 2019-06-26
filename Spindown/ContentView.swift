//
//  ContentView.swift
//  Spindown
//
//  Created by Joseph Smith on 6/12/19.
//  Copyright © 2019 Robotic Snail Software. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        VStack {
            
            HStack {
                PlayerView()
                    .background(SwiftUI.Color.red.edgesIgnoringSafeArea(.all))
                    .rotationEffect(Angle(degrees: 180.0))
                PlayerView()
                    .background(SwiftUI.Color.orange.edgesIgnoringSafeArea(.all))
                    .rotationEffect(Angle(degrees: 180.0))
            }
            Button(action: { print("<#T##items: Any...##Any#>")} ) {
                Text("Reset")
            }
            HStack {
                PlayerView()
                    .background(SwiftUI.Color.green.edgesIgnoringSafeArea(.all))
                PlayerView()
                    .background(SwiftUI.Color.purple.edgesIgnoringSafeArea(.all))
            }
            
            
            
            
        }
        
        
        
        
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
