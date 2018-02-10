//
//  ThirdViewController.swift
//  A1STAFFING
// Created by Dinesh Kunanayagam on 2017-11-24.
//  Copyright © 2018 VMEWBS ENTERPRISE LTD. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Main Form"
        navigationController?.navigationBar.isTranslucent = false
        
        let titlelabel = UILabel(frame:CGRect(x:0,y:0,width : view.bounds.width, height : view.bounds.height))
        titlelabel.text = "A1 STAFFING SOLUTIONS"
        titlelabel.textAlignment = .center
        titlelabel.backgroundColor = .blue
        titlelabel.textColor = .white
        titlelabel.font = UIFont.systemFont(ofSize: 30)
        navigationItem.titleView = titlelabel
        
        
        let btn = UIButton(type: .custom) as UIButton
        btn.backgroundColor = .blue
        btn.setTitle("Register Now", for: .normal)
        btn.frame = CGRect(x: 20, y: 888, width: 725, height: 50)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font =  UIFont.systemFont(ofSize: 30)
        btn.addTarget(self, action: #selector(submitForm), for: .touchUpInside)
        self.view.addSubview(btn)
        
        let toplabel = UILabel(frame:CGRect(x:25,y:20,width : 725, height : 50))
        toplabel.text = "OTHER INFORMATIONS"
        toplabel.textAlignment = .left
        toplabel.backgroundColor = .white
        toplabel.textColor = .black
        toplabel.font = UIFont.systemFont(ofSize: 25)
        self.view.addSubview(toplabel)
    }
    
    @IBAction func submitForm(_ sender: Any) {
        
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
