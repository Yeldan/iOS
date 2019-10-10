//
//  DetailViewController.swift
//  ApiTableView
//
//  Created by Yeldan_Mac on 10/10/19.
//  Copyright © 2019 Yeldan_Mac. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var getrealname = String()
    
    @IBOutlet weak var labelRealName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelRealName.text! = getrealname
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
