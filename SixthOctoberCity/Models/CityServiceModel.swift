//
//  CityServiceModel.swift
//  SixthOctoberCity
//
//  Created by Youssif Hany on 03/11/2022.
//

import Foundation

struct CityService:Identifiable,Codable{
    let id: String
    let name:String
    let address:String
    let category:String
    let imgURL:String?
    let facbookURL:String
    let instgramURL:String
    let phoneNumber:Int
    let rating:Float
    
    init(id: String = UUID().uuidString, name: String, address: String, category: String, imgURL: String, facbookURL: String, instgramURL: String, phoneNumber: Int, rating: Float) {
        self.id = id
        self.name = name
        self.address = address
        self.category = category
        self.imgURL = imgURL
        self.facbookURL = facbookURL
        self.instgramURL = instgramURL
        self.phoneNumber = phoneNumber
        self.rating = rating
    }
}
