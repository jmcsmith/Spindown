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
        VStack() {
            
            PlayerView()
                .background(SwiftUI.Color.green.edgesIgnoringSafeArea(.all))
            PlayerView()
                .background(SwiftUI.Color.purple.edgesIgnoringSafeArea(.all))
            
     
            
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
