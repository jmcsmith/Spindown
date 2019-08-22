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
    var buttonPadding: Bool = false
    init(buttonPadding: Bool) {
        self.buttonPadding = buttonPadding
        
    }
    
    
    var body: some View {
        ZStack(alignment: .center) {
            Text(String(lifeTotal))
                
                .font(.system(size: 90))
                
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
                .padding(EdgeInsets(top: 0, leading: 0, bottom: buttonPadding ? 44 : 0, trailing: 0))
                Button(action: { self.lifeTotal += 1 }) {
                    Text("+")
                        .font(.system(size: 40))
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomTrailing)
                }
            
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                    
                .padding(EdgeInsets(top: 0, leading: 0, bottom: buttonPadding ? 44 : 0, trailing: 0))
                
                
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
        PlayerView(buttonPadding: true)
    }
}
#endif
