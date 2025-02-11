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
    @Environment(\.requestReview) var requestReview
    @Binding var showingModal:Bool
    @State var icon = UIApplication.shared.alternateIconName
    let defaults = UserDefaults.standard
    @State var current = 0
    @EnvironmentObject var manager: ScoreManager
    @StateObject var storeManager: StoreManager
    @AppStorage("tiptotal", store: UserDefaults.standard) var tipTotal: Double = 0.0
    @AppStorage("flipFirstRow", store: UserDefaults.standard) var flipFirstRow = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Settings"), footer: Text("")) {
                    VStack{
                        HStack {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .foregroundColor(.primary)
                                .frame(width: 20, height: 20, alignment: .center)
                            Text("Starting Life")
                                .foregroundColor(.primary)
                            Spacer()
                            Text("- " + self.current.description)
                                .foregroundColor(.primary)
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
                    .padding(4)
                    #if targetEnvironment(macCatalyst)
                    HStack {
//                        Text("Flip top Players")
//                            .foregroundColor(.primary)
                        Toggle("Flip top Players", isOn: $flipFirstRow)
                            .foregroundColor(.primary)
                    }
                    .padding(4)
                    #endif
                    #if os(visionOS)
                    HStack {
                        Toggle("Flip top Players", isOn: $flipFirstRow)
                            .foregroundColor(.primary)
                    }
                    .padding(4)
                    #endif
                }
                #if os(iOS)
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
                        if icon != "DarkIcon" {
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
                            UIApplication.shared.setAlternateIconName("DarkIcon") { error in
                                if let error = error {
                                    print(error.localizedDescription)
                                } else {
                                    print("Success!")
                                    self.icon = "DarkIcon"
                                }
                            }
                        }) {
                            Text("Dark")
                                .foregroundColor(.primary)
                        }
                        if icon == "DarkIcon" {
                            Image(systemName: "checkmark")
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .trailing)
                        }
                    }
                    
                }
                #endif
                if storeManager.myProducts.count > 0 {
                    Section(header: Text("Tips"), footer: Text(getTipText())) {
                        ForEach(storeManager.myProducts.sorted(by: { $0.price.decimalValue < $1.price.decimalValue }), id: \.self) { product in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(product.localizedTitle)
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    Text(product.localizedDescription)
                                        .font(.caption2)
                                        .foregroundColor(.primary)
                                }
                                Spacer()
                                Button(action: {
                                    storeManager.purchaseProduct(product: product)
                                }) {
                                    Text("$\(product.price)")
                                }
                                .foregroundColor(.blue)
                            }
//                            ProductView(id: product.productIdentifier)
//                                .productViewStyle(.compact)
                        }
                    }
                }
                Section(header: Text("About")) {
                    HStack {
                        Image("discord.fill")
                            .symbolRenderingMode(.multicolor)
                        Link("Support - Discord", destination: URL(string: "https://discord.gg/KN2MQX5a")!)
                        
                    }
                    HStack {
                        Image(systemName: "globe.americas.fill")
                            .foregroundColor(.blue)
                        Link("Privacy Policy", destination: URL(string: "https://www.roboticsnailsoftware.com/sd/privacy-policy")!)
                        
                    }
                    HStack {
                        Image(systemName: "globe.americas.fill")
                            .foregroundColor(.blue)
                        Link("Robotic Snail Software - 🤖🐌", destination: URL(string: "https://www.roboticsnailsoftware.com")!)
                        
                    }
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.blue)
                        Button(action: {
                            requestReview()
                        }, label: {
                            Text("Rate My MTG")
                                .font(.subheadline)
                        })
                        
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationBarTitle(Text("Information"), displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.showingModal.toggle()
                                    }) {
                                        Text("Close")
                                    })
        }
       
        .onAppear {
            self.current = self.defaults.integer(forKey: "startingHealth")
       
        }
    }
    private func getTipText() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        if tipTotal <= 0.0 {
            return ""
        }
        return "Thank you for your total tips of \(formatter.string(for: tipTotal) ?? "") 🎉🎉🎉"
        //NumberFormatter.currency.string(from: NSNumber(value: tipTotal)) ?? "0")")
    }
}



