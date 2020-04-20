//
//  InfoView.swift
//  Spindown
//
//  Created by Joseph Smith on 8/12/19.
//  Copyright © 2019 Robotic Snail Software. All rights reserved.
//

import SwiftUI
import StoreKit

struct InfoView: View {
    @Binding var showingModal:Bool
    @State var icon = UIApplication.shared.alternateIconName
    let defaults = UserDefaults.standard
    @State var current = 0
    @EnvironmentObject var manager: ScoreManager
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Settings"), footer: Text("")) {
                    VStack{
                        HStack {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .frame(width: 20, height: 20, alignment: .center)
                            Text("Starting Life")
                            Spacer()
                            Text("- " + self.current.description)
                            Stepper("", onIncrement: {
                                var current = self.defaults.integer(forKey: "startingHealth")
                                current += 1
                                self.current = current
                                self.defaults.set(current, forKey: "startingHealth")
                                self.manager.reset = true
                            }, onDecrement: {
                                var current = self.defaults.integer(forKey: "startingHealth")
                                current -= 1
                                self.current = current
                                self.defaults.set(current, forKey: "startingHealth")
                                self.manager.reset = true
                            })
                            
                        }
                        HStack {
                            
                            
                            
                            Text("20")
                                .foregroundColor(Color.white)
                                
                                .padding()
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                                .background(Color.gray)
                                .cornerRadius(10)
                                .onTapGesture {
                                    self.current = 20
                                    self.defaults.set(20, forKey: "startingHealth")
                                    self.manager.reset = true
                            }
                            Text("30")
                                .foregroundColor(Color.white)
                                
                                .padding()
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                                .background(Color.gray)
                                .cornerRadius(10)
                                .onTapGesture {
                                    self.current = 30
                                    self.defaults.set(30, forKey: "startingHealth")
                                    self.manager.reset = true
                            }
                            Text("40")
                                .foregroundColor(Color.white)
                                
                                .padding()
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                                .background(Color.gray)
                                .cornerRadius(10)
                                .onTapGesture {
                                    self.current = 40
                                    self.defaults.set(40, forKey: "startingHealth")
                                    self.manager.reset = true
                            }
                        }
                                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    }
                }
                #if !targetEnvironment(macCatalyst)
                Section(header: Text("Icons"), footer: Text("")) {
                    HStack {
                        Image("light")
                            .resizable()
                            .frame(width: 29, height: 29, alignment: .center)
                            .cornerRadius(5.088)
                        Button(action: {
                            UIApplication.shared.setAlternateIconName(nil) { error in
                                if let error = error {
                                    print(error.localizedDescription)
                                } else {
                                    print("Success!")
                                    self.icon = ""
                                }
                            }
                        }) {
                            Text("Light")
                                .foregroundColor(.primary)
                        }
                        if icon != "AppIcon-2" {
                            Image(systemName: "checkmark")
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .trailing)
                        }
                    }
                    HStack {
                        Image("dark")
                            .resizable()
                            .frame(width: 29, height: 29, alignment: .center)
                            .cornerRadius(5.088)
                        Button(action: {
                            UIApplication.shared.setAlternateIconName("AppIcon-2") { error in
                                if let error = error {
                                    print(error.localizedDescription)
                                } else {
                                    print("Success!")
                                    self.icon = "AppIcon-2"
                                }
                            }
                        }) {
                            Text("Dark")
                                .foregroundColor(.primary)
                        }
                        if icon == "AppIcon-2" {
                            Image(systemName: "checkmark")
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .trailing)
                        }
                    }
                    
                }
                #endif
                Section(header: Text("About")) {
                    HStack {
                        Image("privacy")
                            .resizable()
                            .frame(width: 20, height: 20, alignment: .center)
                        Button(action: {
                            if let url = URL(string: "https://www.roboticsnailsoftware.com/sd/privacy.html"){
                                UIApplication.shared.open(url, options:[:], completionHandler: nil)
                            }}) {
                                Text("Privacy")
                                    .foregroundColor(.primary)
                        }
                        
                    }
                    HStack {
                        Image("twitter")
                            .resizable()
                            .frame(width: 20, height: 20, alignment: .center)
                        Button(action: {
                            if let url = URL(string: "https://twitter.com/roboticsnailsw"){
                                UIApplication.shared.open(url, options:[:], completionHandler: nil)
                            }}) {
                                Text("Support - @RoboticSnailSoftware")
                                    .foregroundColor(.primary)
                        }
                    }
                    
                    HStack {
                        Image("globe")
                            .resizable()
                            .frame(width: 20, height: 20, alignment: .center)
                        Button(action: {
                            if let url = URL(string: "https://www.roboticsnailsoftware.com"){
                                UIApplication.shared.open(url, options:[:], completionHandler: nil)
                            }}) {
                                Text("Website - RoboticSnailSoftware.com")
                                    .foregroundColor(.primary)
                        }
                    }
                    HStack {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 20, height: 20, alignment: .center)
                        Button(action: {
                            SKStoreReviewController.requestReview()
                        }) {
                            Text("Rate Spindown")
                                .foregroundColor(.primary)
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Text("Information"), displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingModal.toggle()
                }) {
                    Text("Close")
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear { self.current = self.defaults.integer(forKey: "startingHealth") }
    }
    
}

#if DEBUG
struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(showingModal: .constant(true))
    }
}
#endif
