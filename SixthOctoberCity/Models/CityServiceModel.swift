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
    let branches:[String]
    let imgURL:String?
    let facbookURL:URL
    let instgramURL:URL
    let phoneNumber:Int
    let rating:Float
    
    init(id: String = UUID().uuidString, name: String, address: String,branches:[String], category: String, imgURL: String, facbookURL: URL, instgramURL: URL, phoneNumber: Int, rating: Float) {
        self.id = id
        self.name = name
        self.address = address
        self.branches = branches
        self.category = category
        self.imgURL = imgURL
        self.facbookURL = facbookURL
        self.instgramURL = instgramURL
        self.phoneNumber = phoneNumber
        self.rating = rating
    }
}
