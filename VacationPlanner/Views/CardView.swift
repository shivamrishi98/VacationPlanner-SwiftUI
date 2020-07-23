//
//  CardView.swift
//  VacationPlanner
//
//  Created by Shivam Rishi on 22/07/20.
//  Copyright © 2020 shivam. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    var city:String
    var cost:Int
    var averageRating:Double
    var numberOfRatings:Int
    var imageString:String
    var height:CGFloat = 330
    
    
    var body: some View {
        VStack(spacing: 0)
        {
            Image("\(imageString)")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0,maxWidth: .infinity)
                .frame(height: 200)
                .clipped()
                .background(Color.green)
            HStack
                {
                    VStack(alignment: .leading)
                    {
                        Text("\(city)")
                            .font(.system(size: 20, weight: .bold))
                        Text("Starting at Rs\(cost)+")
                            .font(.system(size: 15))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    VStack(alignment: .trailing)
                    {
                        HStack
                            {
                                Spacer()
                                ForEach(0..<Int(averageRating)) { _ in
                                    
                                    Image(systemName: "star.fill")
                                        .foregroundColor(Color.init(red: 212/255, green: 175/255, blue: 55/255))
                                        .font(.system(size: 20))
                                }
                        }.frame(width: 150)
                        HStack
                            {
                                Text("\(numberOfRatings)+ ratings")
                                    .frame(width: 70)
                                    .font(.system(size: 12))
                                    .foregroundColor(Color.gray)
                                Text(String(format: "%.1f/ 5", averageRating))
                                    .font(.system(size: 20, weight: .bold))
                                    .frame(width: 60)
                        }
                    }
            }.frame(height: 70)
                .padding()
            
            
        }
            
        .background(Color.init(red: 0.9, green: 0.9, blue: 0.9))
        .cornerRadius(10)
//        .shadow(radius: 4,y: 4)
        .frame(height: height)
        .clipped()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(city: "japan", cost: 450 , averageRating: 4.6 , numberOfRatings: 1000, imageString: "japan")
    }
}
