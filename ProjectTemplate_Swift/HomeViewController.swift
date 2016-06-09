//
//  ViewController.swift
//  ProjectTemplate_Swift
//
//  Created by charles_packer on 6/9/16.
//  Copyright © 2016 Hot Streak Games. All rights reserved.
//

import UIKit
import SwiftyJSON

class HomeViewController: UIViewController,CoreDataManagerDelegate,UITableViewDelegate,UITableViewDataSource
{
    @IBOutlet
    var playerTable:UITableView!
    
    var players:NSArray! = []

    override func viewDidLoad()
    {
        players = CoreDataManager.sharedInstance.getAllPlayers()
        playerTable.delegate = self
        playerTable.dataSource = self
        CoreDataManager.sharedInstance.delegate = self
        CoreDataManager.sharedInstance.startService()
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func didUpdatePlayerData(results: NSArray) {
        players = results
        playerTable.reloadData()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return players.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:PlayerTableViewCell = tableView.dequeueReusableCellWithIdentifier("PlayerTableViewCell", forIndexPath: indexPath) as! PlayerTableViewCell

        
        let p:PlayerModel = self.players[indexPath.row] as! PlayerModel
        
        cell.configre(p)

        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}

