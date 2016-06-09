//
//  DataService.swift
//  ProjectTemplate_Swift
//
//  Created by charles_packer on 6/9/16.
//  Copyright © 2016 Hot Streak Games. All rights reserved.
//

import Alamofire
import SwiftyJSON

protocol DataServiceDelegate: class {
    func didLoadPlayerData(results:NSMutableArray)
}

class DataService {
    let kPlayersURL = "http://gamechanger2.usite.pro/mlb_master.json"
    
    static let sharedInstance = DataService()
    private init() {}
    
    //define the delegate
    weak var delegate:DataServiceDelegate?
    
    func getPlayerData()
    {
        Alamofire.request(.GET, kPlayersURL, parameters: nil, encoding:.JSON).responseJSON
            {
                response in switch response.result {
            case .Success(let jsonData):
                let players:NSMutableArray = []
                for anItem in jsonData as! [Dictionary<String, AnyObject>] {
                    players.addObject(anItem)
                }
                self.delegate?.didLoadPlayerData(players)
                
            case .Failure(let error):
                print("Request failed with error: \(error)")
                }
        }
    }
}