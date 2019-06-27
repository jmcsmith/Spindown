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
        ZStack(alignment: .center) {
            Text(String(lifeTotal))
          
                 .font(.system(size: 120))
                
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
             .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            HStack() {
                Button(action: {self.lifeTotal -= 1}) {
                    Text("-")
                        .font(.system(size: 40))
                        .multilineTextAlignment(.trailing)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                Button(action: { self.lifeTotal += 1 }) {
                    Text("+")
                         .font(.system(size: 40))
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomTrailing)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
   
                
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
      .padding(.all)
        
        
    }
}

#if DEBUG
struct PlayerView_Previews : PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
#endif
