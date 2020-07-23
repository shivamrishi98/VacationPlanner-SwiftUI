//
//  ContentView.swift
//  VacationPlanner
//
//  Created by Shivam Rishi on 22/07/20.
//  Copyright © 2020 shivam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
      
                      
            TabView(selection: $selection){
              HomeView()
                    .font(.title)
                    .tabItem {
                        VStack {
                            Image(systemName: "house")
                            Text("Home")
                        }
                    }
                    .tag(0)
                Text("Second View")
                    .font(.title)
                    .tabItem {
                        VStack {
                            Image(systemName: "gear")
                            Text("Settings")
                        }
                    }
                    .tag(1)
            }.background(Color.clear)
                .edgesIgnoringSafeArea(.top)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
