//
//  PlayerView.swift
//  Spindown
//
//  Created by Joseph Smith on 6/25/19.
//  Copyright © 2019 Robotic Snail Software. All rights reserved.
//

import SwiftUI



struct PlayerView : View {
    @EnvironmentObject var manager: ScoreManager
    var score = Score()
    @State var scoreIndex = 0
    @State var lifeTotal = 20
    @State var localReset = true
    var buttonPadding: Bool = true
    var paddingAmount: CGFloat = 0
    init(buttonPadding: Bool) {
        self.buttonPadding = buttonPadding
        if DeviceTypes.isiPhoneXAspectRatio() {
            paddingAmount = 44
        } else {
            paddingAmount = 20
        }
        
    }
    
    
    var body: some View {
        
        ZStack(alignment: .center) {
            Text(String(self.manager.scores.isEmpty ? "20" : self.manager.scores[self.scoreIndex].data.description))
                
                .font(.system(size: 90))
                .foregroundColor(Color.init("LifeTotal"))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            HStack() {
                Button(action: {
                    
                    self.manager.scores[self.scoreIndex].data -= 1
                    
                    
                    
                }) {
                    Text("-")
                        .font(.system(size: 40))
                        .multilineTextAlignment(.trailing)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: buttonPadding ? paddingAmount : 0, trailing: 0))
                Button(action: {
                    
                    self.manager.scores[self.scoreIndex].data += 1
                    
                    
                }) {
                    Text("+")
                        .font(.system(size: 40))
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomTrailing)
                }
                    
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                    
                .padding(EdgeInsets(top: 0, leading: 0, bottom: buttonPadding ? paddingAmount : 0, trailing: 0))
                
                
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .padding(.all)
        .onAppear{
            self.manager.scores.append(self.score)
            self.scoreIndex = self.manager.scores.firstIndex(where: {$0.id == self.score.id})!
        }
    }
}

#if DEBUG
struct PlayerView_Previews : PreviewProvider {
    static var previews: some View {
        PlayerView(buttonPadding: true)
    }
}
#endif

