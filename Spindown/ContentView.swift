//
//  ContentView.swift
//  Spindown
//
//  Created by Joseph Smith on 6/12/19.
//  Copyright © 2019 Robotic Snail Software. All rights reserved.
//

import SwiftUI
import StoreKit

struct ContentView : View {
    @State var playerCount = 2
    @State var showingSheet = false
    @State var showingInfo = false
    @State var showingPopover = false
    
    @EnvironmentObject var manager: ScoreManager
    @StateObject var storeManager = StoreManager ()
    @AppStorage("flipFirstRow", store: UserDefaults.standard) var flipFirstRow = false
    
    let productIDs = [
        //Use your product IDs instead
        "coffeeTip1",
        "lunchTip",
        "dinnerTip",
        "m1Mac"
    ]
    
    var playerSheet: ActionSheet {
        ActionSheet(title: Text("Number of Players"), message: nil, buttons: [.default(Text("2"), action: {
            
            self.manager.reset = true
            self.playerCount = 2
            
            self.showingSheet = false
        }),.default(Text("3"), action: {
            self.manager.reset = true
            self.playerCount = 3
            
            self.showingSheet = false
        }),.default(Text("4"), action: {
            self.manager.reset = true
            self.playerCount = 4
            
            self.showingSheet = false
        }), .cancel() ])
        
    }
    
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0) {
            
            HStack {
                PlayerView(buttonPadding: !flipFirstRow)
                    .background(Color.red.edgesIgnoringSafeArea(.top))
                    .rotationEffect(Angle(degrees: flipFirstRow ? 0 : 180.0))
                
                if playerCount > 2 {
                    PlayerView(buttonPadding: !flipFirstRow)
                        .background(Color.orange.edgesIgnoringSafeArea(.top))
                        .rotationEffect(Angle(degrees: flipFirstRow ? 0 : 180.0))
                }
            }
            .edgesIgnoringSafeArea(.top)
            
            HStack(alignment: .center) {
                Menu {
                    Button(action: {
                        self.manager.reset = true
                        self.playerCount = 2
                    }, label: {
                        Text("2 Players")
                    })
                    Button(action: {
                        self.manager.reset = true
                        self.playerCount = 3
                    }, label: {
                        Text("3 Players")
                    })
                    Button(action: {
                        self.manager.reset = true
                        self.playerCount = 4
                    }, label: {
                        Text("4 Players")
                    })
                } label: {
                    Image(systemName: "person.3")
                        .foregroundColor(.blue)
                }
                .menuStyle(.borderlessButton)

                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                Button(action: {
                    self.manager.reset = true
                    print("reset tapped")} ) {
                        Image(systemName: "arrow.clockwise")
                    }
                    .buttonStyle(.borderless)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                Button(action: { self.showingInfo = true } ) {
                    Image(systemName: "gear")
                }.sheet(isPresented: $showingInfo, content: {
                    InfoView(showingModal: self.$showingInfo, storeManager: storeManager).environmentObject(self.manager)
                        .onAppear {
                            if !(storeManager.myProducts.count > 0) {
                                SKPaymentQueue.default().add(storeManager)
                                storeManager.getProducts(productIDs: productIDs)
                            }
                        }
                })
                .buttonStyle(.borderless)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 20, alignment: .center)
            .padding(6)
            HStack {
                PlayerView(buttonPadding: false)
                    .background(SwiftUI.Color.green.edgesIgnoringSafeArea(.bottom))
                if playerCount > 3 {
                    PlayerView(buttonPadding: false)
                        .background(SwiftUI.Color.purple.edgesIgnoringSafeArea(.bottom))
                }
            }
        }
        .onAppear { UIApplication.shared.isIdleTimerDisabled = true }
        .onDisappear { UIApplication.shared.isIdleTimerDisabled = false }
    }
}
final class ScoreManager: ObservableObject {
    @Published var reset: Bool = false {
        didSet{
            if reset == true {
                let defaults = UserDefaults.standard
                for i in 0..<scores.count{
                    scores[i].data = defaults.integer(forKey: "startingHealth")
                }
                reset = false
            }
        }
    }
    
    @Published var scores = [Score]()
}
struct Score{
    var data = 0
    var id = UUID()
}
#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
struct DebugBorder: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content.overlay(Rectangle().stroke(color))
    }
}

extension View {
    func debugBorder(color: Color = .blue) -> some View {
#if DEBUG
        return self.overlay(Rectangle().stroke(color))
#else
        return self
#endif
    }
}
