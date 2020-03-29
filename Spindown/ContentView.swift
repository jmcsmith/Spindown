//
//  ContentView.swift
//  Spindown
//
//  Created by Joseph Smith on 6/12/19.
//  Copyright © 2019 Robotic Snail Software. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State var playerCount = 2
    @State var showingSheet = false
    @State var showingInfo = false
    @State var showingPopover = false

    @EnvironmentObject var manager: ScoreManager
    
    var playerSheet: ActionSheet {
        ActionSheet(title: Text("Number of Players"), message: nil, buttons: [.default(Text("2"), action: {
            self.playerCount = 2
            self.showingSheet = false
        }),.default(Text("3"), action: {
            self.playerCount = 3
            self.showingSheet = false
        }),.default(Text("4"), action: {
            self.playerCount = 4
            self.showingSheet = false
        }), .cancel() ])
        
    }

    
    var body: some View {
        
        VStack {
            
            HStack {
                PlayerView(buttonPadding: true)
                    .background(Color.red.edgesIgnoringSafeArea(.all))
                    .rotationEffect(Angle(degrees: 180.0))
                
                if playerCount > 2 {
                    PlayerView(buttonPadding: true)
                        .background(Color.orange.edgesIgnoringSafeArea(.all))
                        .rotationEffect(Angle(degrees: 180.0))
                }
            }
            .edgesIgnoringSafeArea(.top)
            
            HStack(alignment: .center) {
                    Button(action: { self.showingSheet = true } ) {
                        Image(systemName: "person.3")
                    }.actionSheet(isPresented: $showingSheet, content: {
                        self.playerSheet
                    })
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                Button(action: {
                    self.manager.reset = true
                    print("reset tapped")} ) {
                        Image(systemName: "arrow.clockwise")
                }
                    
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                Button(action: { self.showingInfo = true } ) {
                    Image(systemName: "info.circle")
                    //.padding(.vertical, 10.0)
                }.sheet(isPresented: $showingInfo, content: {
                    InfoView(showingModal: self.$showingInfo)
                })
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 20, alignment: .center)
            HStack {
                PlayerView(buttonPadding: false)
                    .background(SwiftUI.Color.green.edgesIgnoringSafeArea(.all))
                if playerCount > 3 {
                    PlayerView(buttonPadding: false)
                        .background(SwiftUI.Color.purple.edgesIgnoringSafeArea(.all))
                }
            }
        }
    }
}
final class ScoreManager: ObservableObject {
    @Published var reset: Bool = false {
        didSet{
            if reset == true {
                for i in 0..<scores.count{
                    scores[i].data = 20
                }
                reset = false
            }
        }
    }

    @Published var scores = [Score]()
}
struct Score{
    var data = 20
    var id = UUID()
}
#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
