//
//  SecondViewController.swift
//  A1STAFFING
//
//  Created by Kalakchika Sivarasa on 2018-02-09.
//  Copyright © 2018 VMEWBS ENTERPRISE LTD. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let titlelabel = UILabel(frame:CGRect(x:0,y:0,width : view.bounds.width, height : view.bounds.height))
        
        titlelabel.text = "SIGNATURE HERE"
        titlelabel.textAlignment = .center
        titlelabel.backgroundColor = .blue
        titlelabel.textColor = .white
        titlelabel.font = UIFont(name:"Arial", size: 20.0)
        
        navigationItem.titleView = titlelabel

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
