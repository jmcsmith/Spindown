//
//  InfoView.swift
//  Spindown
//
//  Created by Joseph Smith on 8/12/19.
//  Copyright © 2019 Robotic Snail Software. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        
      List {
        Section(header: Text("Icons"), footer: Text("")) {
                          Text("Light")
            Text("Dark")
                        
                      }
               Section(header: Text("About")) {
                   Text("Privacy")
                   Text("Support")
                   Text("Website")
               }
        }
    }
}

#if DEBUG
struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
#endif
