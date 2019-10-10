//
//  ViewController.swift
//  ApiTableView
//
//  Created by Yeldan_Mac on 10/10/19.
//  Copyright © 2019 Yeldan_Mac. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableViewHeroes: UITableView!
    
    let URL_GET_DATA = "https://simplifiedcoding.net/demos/marvel/"
    
    var heroes = [Hero]()
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return heroes.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        
        //getting the hero for the specified position
        let hero: Hero
        hero = heroes[indexPath.row]
        
        cell.labelName.text = hero.name
        
        
        Alamofire.request(hero.imageUrl!).responseImage { response in
            debugPrint(response)
            
            if let image = response.result.value {
                cell.heroImage.image = image
            }
        }
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(URL_GET_DATA).responseJSON { response in
            
            //getting json
            if let json = response.result.value {
                
                //converting json to NSArray
                let heroesArray : NSArray  = json as! NSArray
                
                //traversing through all elements of the array
                for i in 0..<heroesArray.count{
                    
                    //adding hero values to the hero list
                    self.heroes.append(Hero(
                        name: (heroesArray[i] as AnyObject).value(forKey: "name") as? String,
                        imageUrl: (heroesArray[i] as AnyObject).value(forKey: "imageurl") as? String,
                        realName: (heroesArray[i] as AnyObject).value(forKey: "realname") as? String
                    ))
                    
                }
                
                //displaying data in tableview
                self.tableViewHeroes.reloadData()
            }
        }

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DvC = Storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        DvC.getrealname = heroes[indexPath.row].realName ?? ""
        self.navigationController?.pushViewController(DvC, animated: true)
    }

}
