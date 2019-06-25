//
//  PlayerView.swift
//  Spindown
//
//  Created by Joseph Smith on 6/25/19.
//  Copyright © 2019 Robotic Snail Software. All rights reserved.
//

import SwiftUI



struct PlayerView : View {
    @State var lifeTotal = 20
    var body: some View {
        VStack() {
            Text(String(lifeTotal))
            HStack {
                Button(action: { self.lifeTotal += 1 }) {
                    Text("+")
                }
                Button(action: {self.lifeTotal -= 1}) {
                    Text("-")
                }
            }
        }
  
    }
}

#if DEBUG
struct PlayerView_Previews : PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
#endif
