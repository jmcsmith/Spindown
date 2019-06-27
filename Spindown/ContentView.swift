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
            HStack(alignment: .center) {
                Button(action: { print("settings tapped")} ) {
                    Image(systemName: "gear")
                        //.padding(.vertical, 10.0)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                Button(action: { print("reset tapped")} ) {
                    Image(systemName: "arrow.clockwise")
                        //.padding(.vertical, 10.0)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                Button(action: { print("inf tapped")} ) {
                    Image(systemName: "info.circle")
                        //.padding(.vertical, 10.0)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            }
           .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 20, alignment: .center)
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
