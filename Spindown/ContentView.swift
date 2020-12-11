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
                #if !targetEnvironment(macCatalyst)
                Button(action: { self.showingSheet = true } ) {
                    Image(systemName: "person.3")
                }.actionSheet(isPresented: $showingSheet, content: {
                    self.playerSheet
                })
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                #else
                Button(action: { self.showingSheet = true } ) {
                    Image(systemName: "person.3")
                }.popover(isPresented: $showingSheet, content: {
                    VStack {
                        Text("Number of Players")
                            
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                        GeometryReader { geometry in
                            Button(action: {
                                self.manager.reset = true
                                self.playerCount = 2
                                self.showingSheet = false
                            }) {
                                Text("2")
                                    .frame(
                                        minWidth: (geometry.size.width / 2) - 25,
                                        maxWidth: .infinity, minHeight: 44
                                    )
                                    .font(Font.subheadline.weight(.bold))
                                    .background(Color.gray).opacity(0.8)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(12)
                            }    .lineLimit(2)
                            .multilineTextAlignment(.center)
                            //.padding([.leading,.trailing], 5)
                        }
                        .padding()
                        GeometryReader { geometry in
                            Button(action: {
                                self.manager.reset = true
                                self.playerCount = 3
                                self.showingSheet = false
                            }) {
                                Text("3")
                                    .frame(
                                        minWidth: (geometry.size.width / 2) - 25,
                                        maxWidth: .infinity, minHeight: 44
                                    )
                                    .font(Font.subheadline.weight(.bold))
                                    .background(Color.gray).opacity(0.8)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(12)
                            }.lineLimit(2)
                            .multilineTextAlignment(.center)
                            
                        } .padding()
                        GeometryReader { geometry in
                            Button(action: {
                                self.manager.reset = true
                                self.playerCount = 4
                                self.showingSheet = false
                            }) {
                                Text("4")
                                    .frame(
                                        minWidth: (geometry.size.width / 2) - 25,
                                        maxWidth: .infinity, minHeight: 44
                                    )
                                    .font(Font.subheadline.weight(.bold))
                                    .background(Color.gray).opacity(0.8)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(12)
                            }.lineLimit(2)
                            .multilineTextAlignment(.center)
                            
                        } .padding()
                    }.padding()
                    .background(Color.gray.opacity(0.2))
                })
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                #endif
                Button(action: {
                        self.manager.reset = true
                        print("reset tapped")} ) {
                    Image(systemName: "arrow.clockwise")
                }
                
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                Button(action: { self.showingInfo = true } ) {
                    Image(systemName: "gear")
                    //.padding(.vertical, 10.0)
                }.sheet(isPresented: $showingInfo, content: {
                    InfoView(showingModal: self.$showingInfo, storeManager: storeManager).environmentObject(self.manager)
                        .onAppear {
                            
                            if !(storeManager.myProducts.count > 0) {
                                SKPaymentQueue.default().add(storeManager)
                                storeManager.getProducts(productIDs: productIDs)
                            }
                        }
                })
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 20, alignment: .center)
            .padding(3)
            HStack {
                PlayerView(buttonPadding: false)
                    .background(SwiftUI.Color.green.edgesIgnoringSafeArea(.all))
                if playerCount > 3 {
                    PlayerView(buttonPadding: false)
                        .background(SwiftUI.Color.purple.edgesIgnoringSafeArea(.all))
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
