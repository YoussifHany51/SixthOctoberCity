//
//  HomeView.swift
//  SixthOctoberCity
//
//  Created by Youssif Hany on 31/10/2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var vm : CityServiceViewModel
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack{
                    VStack{
                        UpperText
                         Spacer()
                        SearchBarView(searchText: $vm.searchText)
                      
                    }
                }
                .navigationTitle("Discover")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(CityServiceViewModel())
    }
}

extension HomeView{
    
    private var UpperText:some View{
        HStack {
            Text("any thing in 6th October city")
                 .padding(.leading)
                 .foregroundColor(.gray)
            Spacer()
        }
    }
}
