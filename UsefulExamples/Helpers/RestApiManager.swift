//
//  RestApiManager.swift
//  UsefulExamples
//
//  Created by Nitin Khurana on 23/02/18.
//  Copyright © 2018 Nitin Khurana. All rights reserved.
//

import UIKit
import SwiftyJSON

class RestApiManager: NSObject {

    static let instance = RestApiManager();
    
    func callApi(url: String, onCompletion: @escaping (JSON) -> Void) {
        
        makeApiCall(route: url, onCompletion: {json -> Void in
            print(json)
            onCompletion(json)
        })
    }

    private func makeApiCall(route: String, onCompletion: @escaping (JSON) -> Void) {
        
        let request = URLRequest(url: URL(string: route)!)
        let session = URLSession.shared
        
        let task = session.dataTask(with: URL(string: route)!, completionHandler: {jsonData, response, error -> Void in
            do{
                let json:JSON = try JSON(data: jsonData!)
                onCompletion(json)
            }
            catch {
                print("There was some exception")
            }
        })
        
        task.resume()
    }
}
