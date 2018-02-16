//
//  SecondViewController.swift
//  A1STAFFING
//
//  Created by Dinesh Kunanayagam on 2017-11-24.
//  Copyright © 2018 VMEWBS ENTERPRISE LTD. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    // MARK: - UI Items declaration
    @IBOutlet weak var txt_main_phone: UITextField!
    @IBOutlet weak var txt_mobile: UITextField!
    @IBOutlet weak var txt_email: UITextField!
    @IBOutlet weak var txt_social_insurance: UITextField!    
    @IBOutlet weak var txt_address: UITextField!
    @IBOutlet weak var lbl_error_two: UILabel!
    
    
    // MARK: - Variable declarations
    var f_main_phone : String?
    var f_mobile : String?
    var f_main_email : String?
    var f_address : String?
    var f_social_insurance : String?
    
     // MARK: - Onload function
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Main Form"
        navigationController?.navigationBar.isTranslucent = false
        
        // MARK: - Title declaration
        let titlelabel = UILabel(frame:CGRect(x:0,y:0,width : view.bounds.width, height : view.bounds.height))
        titlelabel.text = "A1 STAFFING SOLUTIONS"
        titlelabel.textAlignment = .center
        titlelabel.backgroundColor = .blue
        titlelabel.textColor = .white
        titlelabel.font = UIFont.systemFont(ofSize: 30)
        navigationItem.titleView = titlelabel
        
        txt_main_phone.setLeftPaddingPoints(10)
        txt_main_phone.setRightPaddingPoints(10)
        
        txt_mobile.setLeftPaddingPoints(10)
        txt_mobile.setRightPaddingPoints(10)
        
        txt_email.setLeftPaddingPoints(10)
        txt_email.setRightPaddingPoints(10)
        
        txt_social_insurance.setLeftPaddingPoints(10)
        txt_social_insurance.setRightPaddingPoints(10)
        
        txt_address.setLeftPaddingPoints(10)
        txt_address.setRightPaddingPoints(10)
    }
    
    //MARKL - Validates form
    public func validateform() -> Int{
        f_main_phone = txt_main_phone.text
        if(f_main_phone == nil){
            f_main_phone = ""
        }
        
        f_mobile = txt_mobile.text
        if(f_mobile == nil){
            f_mobile = ""
        }
        
        f_main_email = txt_email.text
        if(f_main_email == nil){
            f_main_email = ""
        }
        
        f_address = txt_address.text
        if(f_address == nil){
            f_address = ""
        }
        
        f_social_insurance = txt_social_insurance.text
        if(f_social_insurance == nil){
            f_social_insurance = ""
        }
        
        if(f_main_phone! != "" && f_address! != ""){
            return 1
        }else{
            return 0
        }
    }
    
    // MARK: - Third View Function
    @IBAction func showThird(_ sender: Any) {
        //if(validateform() == 0){
            //lbl_error_two.text="Please fill all required fields"
           // let alert = UIAlertController(title: "Alert", message: "Please fill all required fields", preferredStyle: .alert)
           // alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            //self.present(alert, animated: true, completion: nil)
        //}
        //else if(validateform() == 1){
            //lbl_error_two.text="";
            performSegue(withIdentifier: "segtothird", sender: self)
       // }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
