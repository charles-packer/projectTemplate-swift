//
//  CoreDataManager.swift
//  ProjectTemplate_Swift
//
//  Created by charles_packer on 6/9/16.
//  Copyright © 2016 Hot Streak Games. All rights reserved.
//

import Foundation
import MagicalRecord


protocol CoreDataManagerDelegate: class {
    func didUpdatePlayerData(results:NSArray)

}

class CoreDataManager:DataServiceDelegate
{

    var defaultContext:NSManagedObjectContext
    var hasLoaded:Bool = false

    static let sharedInstance = CoreDataManager()
    private init()
    {
        MagicalRecord.setupCoreDataStack()
        self.defaultContext = NSManagedObjectContext.MR_defaultContext()
    }
    
    weak var delegate:CoreDataManagerDelegate?

    func startService()
    {
        DataService.sharedInstance.delegate = self
        DataService.sharedInstance.getPlayerData()
    }
    
    func getAllPlayers()->NSArray
    {
        return PlayerModel.MR_findAll()
    }
    
    func didLoadPlayerData(results: NSMutableArray)
    {
        MagicalRecord.saveWithBlock({ (localContext : NSManagedObjectContext!) in
            
            for index in 1...results.count-1
            {
                let playerId:NSString = results[index].objectForKey("playerID") as! String
                let playerName:NSString = results[index].objectForKey("player") as! String

                if PlayerModel.MR_findFirstByAttribute("playerID", withValue: playerId, inContext: localContext) == nil
                {
                    let newPlayer:PlayerModel  = PlayerModel.MR_createInContext(self.defaultContext) as! PlayerModel
                    newPlayer.playerID = playerId as String
                    newPlayer.fullName = playerName as String
                    NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
                } else
                {
                    let existingPlayer:PlayerModel = PlayerModel.MR_findFirstByAttribute("playerID", withValue: playerId, inContext: localContext) as! PlayerModel
                    existingPlayer.playerID = playerId as String
                    existingPlayer.fullName = playerName as String
                }
            }
            }, completion: { (success : Bool, error : NSError!) in
                // This block runs in main thread
                self.hasLoaded = true
                self.delegate?.didUpdatePlayerData(PlayerModel.MR_findAll())
        })

    }
}