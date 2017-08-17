//
//  MenuViewController.swift
//  KenticoCloud
//
//  Created by Martin Makarsky on 17/08/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet var tableView: UITableView!
    
    fileprivate let menuOptions = ["Articles", "Cafes"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        //viewConfigurations()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
        cell.menuOption.text = menuOptions[indexPath.row]
        cell.menuImage.image = UIImage(named: "menu_" + String(indexPath.row + 1))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var identifier = ""
        
        switch indexPath.row {
        case 0:
            identifier = "ArticlesViewController"
        case 1:
            identifier = "CafesViewController"
        default:
            print("Add controller ID for row: \(indexPath.row)")
        }
        
        let centerViewController: UIViewController = mainStoryboard.instantiateViewController(withIdentifier: identifier)
        let centerNavigationViewController = UINavigationController(rootViewController: centerViewController)
        
        panel!.configs.bounceOnCenterPanelChange = true
        _ = panel!.center(centerNavigationViewController)
        
    }
}