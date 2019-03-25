//
//  EarthquakeDownloadManager.swift
//  Earthquake
//
//  Created by SHILEI CUI on 3/25/19.
//  Copyright © 2019 scui5. All rights reserved.
//

import Foundation

class Apihandler: NSObject {
    static let  sharedInstance = Apihandler()
    private override init() {}
    
    func getApiForEq(completion: @escaping (_ arrayMovie: [Feature]?, _ error: Error?) -> Void){
        
                let urlString1 = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_day.geojson"
        
                guard let url = URL(string: urlString1) else{
                    return
                }
                URLSession.shared.dataTask(with : url){ (data, response, error) in
                            guard let data = data else {
                                return
                            }
        
                            if error == nil{
                                do{
                                    let earthquake = try? JSONDecoder.init().decode(Earthquake.self, from: data)
                                    //print(earthquake)
                                    //print(earthquake?.features)
                                    //print(earthquake?.features[0].id)
                                    DispatchQueue.main.async {
                                    completion(earthquake?.features,nil)
                                    }
                                }
                                catch{
                                    completion(nil,error)
                                }
                            }
                    }.resume()
    }
}

