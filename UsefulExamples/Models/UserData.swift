//
//  UserData.swift
//  UsefulExamples
//
//  Created by Nitin Khurana on 23/02/18.
//  Copyright © 2018 Nitin Khurana. All rights reserved.
//

import UIKit
import SwiftyJSON

class UserData  {
    
    var name:String?
    var gender:String?
    var location:String?
    var email:String?
    var username:String?
    var password:String?
    var dob:String?
    var phone:String?
    var picture:String?
    
    init(json: JSON) {
        parse(json: json)
    }
    
    func parse(json: JSON) {
        
        gender = json["gender"].stringValue
        let j_name = json["name"]
        name = j_name["title"].stringValue + " " + j_name["first"].stringValue + " "
            + j_name["last"].stringValue
        
        let j_location = json["location"]
        location = j_location["street"].stringValue + " " + j_location["city"].stringValue + " "
            + j_location["state"].stringValue + " " + j_location["postcode"].stringValue
        
        email = json["email"].stringValue
        username = json["username"].stringValue
        password = json["password"].stringValue
        dob = json["dob"].stringValue
        phone = json["phone"].stringValue
        picture = json["picture"]["thumbnail"].stringValue
    }
    
    
}
