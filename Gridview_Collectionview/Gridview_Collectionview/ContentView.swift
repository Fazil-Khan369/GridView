//
//  ContentView.swift
//  Gridview_Collectionview
//
//  Created by Fazil P on 29/11/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        HomeView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct HomeView: View {
    
    @State var Grid: [Int] = []
    
    @State var data = [
        
        Type(name: "Assassins", image: "Assassins"),
        Type(name: "callofduty", image: "callofduty"),
        Type(name: "FIFA20", image: "FIFA20"),
        Type(name: "Pubg", image: "Pubg"),
        Type(name: "Spiderman", image: "Spiderman"),
        Type(name: "Uncharted", image: "Uncharted"),
        Type(name: "FIFA20", image: "FIFA20"),
        ]
    var body: some View {
        
        VStack(spacing: 0) {
            
            ZStack {
                
                HStack {
                    
                    Button(action: {
                        self.data.append(Type(name: "Pubg", image: "Pubg"))
                        self.Grid.removeAll()
                        self.generateGrid()
                    })
                    {
                        Image(systemName: "square.grid.3x2.fill")
                            .renderingMode(.original)
                            .frame(width: 70, height: 70)
                    }
                    
                    Spacer()
                    
                    Button(action: {})
                    {
                        Image(systemName: "person.crop.circle.fill")
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                    }
                }
                
                Text("PS4 Games")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Color"))
            }
            .padding()
            
            MainView(data: self.$data, Grid: self.$Grid)
            
            TabBar()
            
        }.background(Color.black.opacity(0.06).edgesIgnoringSafeArea(.top))
        .edgesIgnoringSafeArea(.bottom)
        .onAppear {
            self.generateGrid()
        }
    }
    
    func generateGrid() {
        
        for i in stride(from: 0, to: self.data.count, by: 2) {
            
            if i != self.data.count {
                self.Grid.append(i)
            }
        
        }
    }
}


struct TabBar: View {
    
    @State var index = 0
    
    var body: some View {
        
        HStack {
            Button(action: {
                self.index = 0
            })
            {
                VStack {
                    
                    Image("Home")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(self.index == 0 ? .red : .gray)
                    
                    if self.index == 0 {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 8, height: 8)
                            .offset(y: 6)
                    }
                }
            }
            
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 1
            })
            {
                VStack {
                    
                    Image("Search")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(self.index == 1 ? .red : .gray)
                    
                    if self.index == 1 {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 8, height: 8)
                            .offset(y: 6)
                    }
                }
            }
            
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 2
            })
            {
                VStack {
                    
                    Image("Chat")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(self.index == 2 ? .red : .gray)
                    
                    if self.index == 2 {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 8, height: 8)
                            .offset(y: 6)
                    }
                }
            }
            
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 3
            })
            {
                VStack {
                    
                    Image("Filter")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(self.index == 3 ? .red : .gray)
                    
                    if self.index == 3 {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 8, height: 8)
                            .offset(y: 6)
                    }
                }
            }
        }
        .padding(.horizontal,35)
        .padding(.top, 12)
        .padding(.bottom,(UIApplication.shared.windows.first?.safeAreaInsets.bottom)! + 15)
        .background(Color.white)
        .shadow(color: Color.black.opacity(0.04), radius: 0, x: 0, y: -6)
        .animation(.default)
    }
}

struct Card: View {
    
    var datas: Type
    
    var body: some View {
        
        VStack(spacing: 15) {
            
            Image(datas.image)
                .resizable()
                .frame(width: (UIScreen.main.bounds.width - 45) / 2,height: 260)
                .cornerRadius(12)
            
            Text(datas.name)
            
            Button(action: {}) {
                
                Text("Play Now")
                    .foregroundColor(.white)
                    .frame(width: (UIScreen.main.bounds.width - 70) / 2)
                    .padding(.vertical,10)
            }
            .background(Color("Color"))
            .cornerRadius(10)
            .shadow(radius: 6)
        }
    }
}

struct MainView: View {
    
    @Binding var data : [Type]
    @Binding var Grid: [Int]
    
    var body: some View {
        
        VStack {
            
            if !self.Grid.isEmpty {
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 25) {
                        ForEach(self.Grid,id: \.self) {i in
                            
                            HStack(spacing: 15) {
                                ForEach(i...i+1,id: \.self) { j in
                                    
                                    VStack {
                                        if j != self.data.count {
                                            Card(datas: self.data[j])
                                        }
                                    }
                                }
                                if i == self.Grid.last && self.data.count % 2 != 0 {
                                    Spacer(minLength: 0)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
  
        }
    }
}

struct Type {
    
    var name: String
    var image: String
}


