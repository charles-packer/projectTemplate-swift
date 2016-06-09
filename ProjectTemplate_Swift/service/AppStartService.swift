//
//  AppStartService.swift
//  ProjectTemplate_Swift
//
//  Created by charles_packer on 6/9/16.
//  Copyright © 2016 Hot Streak Games. All rights reserved.
//

import Foundation

class AppStartService:CoreDataManagerDelegate
{
    let requiresAuth:Bool = false
    static let sharedInstance = AppStartService()
    
    private init(){}
    
    func startService()
    {
        CoreDataManager.sharedInstance.delegate = self
        CoreDataManager.sharedInstance.startService()
    }
    
    func didUpdatePlayerData(results: NSArray)
    {
        if !requiresAuth
        {
            ScreenService.sharedInstance.gotoHomeScreen()
        }
    }
}