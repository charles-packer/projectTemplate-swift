//
//  WindowService.swift
//  ProjectTemplate_Swift
//
//  Created by charles_packer on 6/9/16.
//  Copyright © 2016 Hot Streak Games. All rights reserved.
//

import UIKit

class ScreenService
{
    var mainWindow:UIWindow!

    var mainStoryboard:UIStoryboard!
    static let sharedInstance = ScreenService()
    
    private init(){}
    
    func startScreenService(mWindow:UIWindow)
    {
        mainWindow = mWindow
        mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    }
    
    func gotoHomeScreen()
    {
        let homeVC:HomeViewController = self.mainStoryboard.instantiateViewControllerWithIdentifier("homeScreen") as! HomeViewController
        
        mainWindow.rootViewController?.presentViewController(homeVC, animated: true, completion: { 
            
        });
        
    }
    
}