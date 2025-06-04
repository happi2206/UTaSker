//
//  FiltersView.swift
//  UTaSker
//
//  Created by Happiness on 1/6/2025.
//

import SwiftUI

struct FiltersView: View {
    let filters = ["Academic", "Campus", "Labour", "Tech", "Creative"]
    
    var body: some View {
        VStack {
            
            VStack(spacing: 16) {
                
                
                HStack {
                    Text("Explore Tasks")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    NotificationButtonView()
                }
                .padding(.horizontal)
                .padding(.top)
                
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    Text("Search for tasks")
                        .foregroundColor(.gray)
                    
                    Spacer()
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal)
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        
                        HStack {
                            Image(systemName: "slider.horizontal.3")
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        
                        
                        ForEach(filters, id: \.self) { filter in
                            Text(filter)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .background(Color(.systemGray6))
                                .cornerRadius(10)
                                .font(.subheadline)
                        }
                    }.padding()
                    
                }
                
                
            }
            .background(Color.white)
         
        }
    }
}
