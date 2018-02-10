//
//  FirstViewController.swift
//  A1STAFFING
//
//  Created by Dinesh Kunanayagam on 2017-11-24.
//  Copyright © 2018 VMEWBS ENTERPRISE LTD. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    // MARK: - UI Items declaration
    @IBOutlet weak var txt_first_name: UITextField!    
    @IBOutlet weak var title_btn_mr: DLRadioButton!    
    @IBOutlet weak var title_btn_miss: DLRadioButton!
    @IBOutlet weak var title_btn_mrs: DLRadioButton!
    @IBOutlet weak var gender_btn_male: DLRadioButton!
    @IBOutlet weak var gender_btn_female: DLRadioButton!
    
    // MARK: - Variable declarations
    var f_title : String = ""
    var f_gender : String = ""
    
    // MARK: - On load function
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
        
        txt_first_name.setLeftPaddingPoints(10)
        txt_first_name.setRightPaddingPoints(10)        
    }
    
    // MARK: - show second function
    @IBAction func showsecond(_ sender: Any) {
        show(SecondViewController(), sender: self)
    }
   

    // MARK: - get title function
    @IBAction func get_title(_ sender: DLRadioButton) {
        if(sender.tag == 1){
            f_title = "Mr"
        }else if(sender.tag == 2){
            f_title = "Mrs"
        }else if(sender.tag == 3){
            f_title = "Miss"
        }
    }
    
    // MARK: - get gender function
    @IBAction func get_gender(_ sender: DLRadioButton) {
        if(sender.tag == 1){
           f_gender = "male"
        }else if(sender.tag == 2){
            f_gender = "female"
        }
        
    }
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
