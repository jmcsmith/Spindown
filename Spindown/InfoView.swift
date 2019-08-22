//
//  InfoView.swift
//  Spindown
//
//  Created by Joseph Smith on 8/12/19.
//  Copyright © 2019 Robotic Snail Software. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    @Binding var showingModal:Bool
@State var icon = UIApplication.shared.alternateIconName
    var body: some View {
        NavigationView {
            List {
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
                Section(header: Text("About")) {
                    HStack {
                        Image("privacy")
                            .resizable()
                            .frame(width: 20, height: 20, alignment: .center)
                        Button(action: {
                            if let url = URL(string: "http://www.mymtg.app/privacy"){
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
    }
}

#if DEBUG
//struct InfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        //InfoView(showingModal: True)
//    }
//}
#endif
