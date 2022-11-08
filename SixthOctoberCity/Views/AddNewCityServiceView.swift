//
//  AddNewCityServiceView.swift
//  SixthOctoberCity
//
//  Created by Youssif Hany on 08/11/2022.
//

import SwiftUI

struct AddNewCityServiceView: View {
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes
        = [.foregroundColor:UIColor.init(.red)]
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    
                }
                .navigationTitle("Add your place")
            }
        }
    }
}

struct AddNewCityServiceView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewCityServiceView()
    }
}
