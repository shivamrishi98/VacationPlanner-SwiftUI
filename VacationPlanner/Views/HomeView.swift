//
//  HomeView.swift
//  VacationPlanner
//
//  Created by Shivam Rishi on 22/07/20.
//  Copyright © 2020 shivam. All rights reserved.
//

import SwiftUI

enum enumContinent
{
    case asia,europe, southAmerica , northAmerica , africa
}

struct destinationItem:Identifiable {
    var id = UUID()
    var name:String
    var ratingAverage:Double
    var numberOfRatings:Int
    var imageString:String
    var minCost:Int
    var continentVal:enumContinent
}

struct Continent:Identifiable {
    var id = UUID()
    var name:String
    var color:Color
    var enumCont: enumContinent
}





var blue_1 = Color.init(red: 138/255, green: 190/255, blue: 234/255)
var blue_2 = Color.init(red: 111/255, green: 148/255, blue: 182/255)
var blue_3 = Color.init(red: 96/255, green: 152/255, blue: 202/255)

struct HomeView: View {
    
    var listOfDestinations:[destinationItem] = [
        
        destinationItem.init(name: "Amsterdam", ratingAverage: 4.7, numberOfRatings: 1036, imageString: "amsterdam", minCost: 799, continentVal: .europe),
        destinationItem.init(name: "Cinque Terre", ratingAverage: 4.2, numberOfRatings: 2305, imageString: "cinqueTerre", minCost: 1099, continentVal: .europe),
        destinationItem.init(name: "Provence", ratingAverage: 5.0, numberOfRatings: 804, imageString: "provence", minCost: 1249, continentVal: .europe),
        destinationItem.init(name: "Santorini", ratingAverage: 3.8, numberOfRatings: 1204, imageString: "santorini", minCost: 1340, continentVal: .europe),
        destinationItem.init(name: "Stockholm", ratingAverage: 4.3, numberOfRatings: 605, imageString: "stockholm", minCost: 1100, continentVal: .europe),
        destinationItem.init(name: "Thimble Islands", ratingAverage: 4.6, numberOfRatings: 352, imageString: "thimbleIslands", minCost: 759, continentVal: .europe),
        destinationItem.init(name: "Venice", ratingAverage: 4.2, numberOfRatings: 2704, imageString: "venice", minCost: 1049, continentVal: .europe),
        destinationItem.init(name: "Zurich", ratingAverage: 4.8, numberOfRatings: 1806, imageString: "zurich", minCost: 699, continentVal: .europe),
        destinationItem.init(name: "Japan", ratingAverage: 4.6, numberOfRatings: 1023, imageString: "japan", minCost: 1299, continentVal: .asia),
        destinationItem.init(name: "Hong Kong", ratingAverage: 4.2, numberOfRatings: 1905, imageString: "hongKong", minCost: 959, continentVal: .asia),
        destinationItem.init(name: "Thailand", ratingAverage: 4.9, numberOfRatings: 1201, imageString: "thailand", minCost: 1099, continentVal: .asia),
        destinationItem.init(name: "Vietnam", ratingAverage: 4.1, numberOfRatings: 641, imageString: "vietnam", minCost: 759, continentVal: .asia),
        destinationItem.init(name: "Kenya", ratingAverage: 4.5, numberOfRatings: 701, imageString: "kenya", minCost: 1459, continentVal: .africa),
        destinationItem.init(name: "Egypt", ratingAverage: 5.0, numberOfRatings: 1405, imageString: "egypt", minCost: 1299, continentVal: .africa),
        destinationItem.init(name: "Patagonia", ratingAverage: 4.9, numberOfRatings: 1232, imageString: "patagonia", minCost: 1199, continentVal: .southAmerica),
        destinationItem.init(name: "Rio De Janeiro", ratingAverage: 4.2, numberOfRatings: 1038, imageString: "rio", minCost: 1049, continentVal: .southAmerica),
        destinationItem.init(name: "New York City", ratingAverage: 4.6, numberOfRatings: 1247, imageString: "nyc", minCost: 599, continentVal: .northAmerica),
        destinationItem.init(name: "Chicago", ratingAverage: 4.8, numberOfRatings: 1923, imageString: "chicago", minCost: 649, continentVal: .northAmerica)
        
    ]
    
    
    
    @State private var val = ""
    @State private var thisContinent:enumContinent = enumContinent.asia
    var listOfContinents:[Continent] = [
        Continent.init(name: "Asia", color: blue_1, enumCont: .asia),
        Continent.init(name: "Europe", color: blue_2, enumCont: .europe),
        Continent.init(name: "South America", color: blue_3, enumCont: .southAmerica),
        Continent.init(name: "North America", color: blue_1, enumCont: .northAmerica),
        Continent.init(name: "Africa", color: blue_2, enumCont: .africa)
    ]
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [blue_2, Color.white]), startPoint: .init(x: 0, y: 0), endPoint: .trailing)
                .edgesIgnoringSafeArea(.all)
            
            
            
            
            VStack(spacing:0)
            {
                
                HStack {
                    Spacer().frame(width:10)
                    TextField("Where do you want to go?", text: $val)
                        .padding()
                        
                        .background(Color.init(red: 0.95, green: 0.95, blue: 0.95))
                        .cornerRadius(20)
                    Spacer().frame(width:10)
                }
                
                
                ScrollView(.horizontal,showsIndicators: false)
                {
                    HStack
                        {
                            Spacer().frame(width: 10)
                            ForEach(listOfContinents, id: \.id)
                            { continent in
                                
                                
                                Button(action: {
                                    self.thisContinent = continent.enumCont
                                })
                                {
                                    Text("\(continent.name)")
                                        .padding()
                                        .foregroundColor(self.thisContinent == continent.enumCont ? Color.white : continent.color)
                                        .background(self.thisContinent == continent.enumCont ?  continent.color : Color.init(red: 0.95, green: 0.95, blue: 0.95))
                                        .cornerRadius(10)
                                        .font(.system(size: 15, weight: .bold))
                                }
                                
                            }
                            
                            
                            
                            
                    }
                }
                .padding(.bottom, 20).padding(.top, 20)
                //                .background(Color.clear)
                
                ScrollView(.vertical, showsIndicators: false)
                {
                    VStack(spacing:0)
                    {
                        ForEach(listOfDestinations, id: \.id) { destination in
                            CardView(city: destination.name, cost: destination.minCost, averageRating: destination.ratingAverage, numberOfRatings: destination.numberOfRatings, imageString: destination.imageString, height: self.thisContinent == destination.continentVal ? 330 : 0)
                            .shadow(radius: self.thisContinent == destination.continentVal ?  4 : 0)
                        }
                    }
                    .padding()
                    .background(Color.clear)
                    Spacer().frame(height:80)
                }
                    Spacer()
                
            }
        }.edgesIgnoringSafeArea(.bottom)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
