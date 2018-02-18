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
    @IBOutlet weak var txt_middle_name: UITextField!    
    @IBOutlet weak var txt_last_name: UITextField!
    
    @IBOutlet weak var title_btn_mr: DLRadioButton!    
    @IBOutlet weak var title_btn_miss: DLRadioButton!
    @IBOutlet weak var title_btn_mrs: DLRadioButton!
    
    @IBOutlet weak var gender_btn_male: DLRadioButton!
    @IBOutlet weak var gender_btn_female: DLRadioButton!
    @IBOutlet weak var dob: UIDatePicker!
    
    @IBOutlet weak var lbl_error_one: UILabel!
    
    // MARK: - Variable declarations
    var f_title : String = ""
    var f_first_name : String?
    var f_middle_name : String?
    var f_last_name : String?
    var f_gender : String = ""
    var f_dob : String = ""
    
    
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
        
        txt_middle_name.setLeftPaddingPoints(10)
        txt_middle_name.setRightPaddingPoints(10)
        
        txt_last_name.setLeftPaddingPoints(10)
        txt_last_name.setRightPaddingPoints(10)
    
        let calendar: NSCalendar = NSCalendar(calendarIdentifier:  .gregorian)!
        calendar.timeZone = NSTimeZone(name: "UTC")! as TimeZone
        let components: NSDateComponents = NSDateComponents()
        components.year = 1995
        components.month = 5
        components.day = 21
        let defaultDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
        
        dob.datePickerMode = .date
        dob.date = defaultDate as Date
    }
    
    //MARKL - Validates form
    public func validateform() -> Int{
        f_first_name = txt_first_name.text
        if(f_first_name == nil){
            f_first_name = ""
        }
        
        f_middle_name = txt_middle_name.text
        if(f_middle_name == nil){
            f_middle_name = ""
        }
        
        f_last_name = txt_last_name.text
        if(f_last_name == nil){
            f_last_name = ""
        }
        
        if(f_first_name! != "" && f_last_name! != "" && f_title != "" && f_gender != "" && f_dob != ""){
            return 1
        }else{
            return 0
        }
    }
    
    // MARK: - show second function
    @IBAction func showsecond(_ sender: Any) {
        if(validateform() == 0){
            //lbl_error_one.text="Please fill all required fields"
            let alert = UIAlertController(title: "Alert", message: "Please fill all required fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
       }
       else if(validateform() == 1){
            //lbl_error_one.text="";
            performSegue(withIdentifier: "seqtosecond", sender: self)        
       }
    }
    
    //MARK: - perform segue
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seqtosecond"{
            let vc = segue.destination as! SecondViewController
            vc.f_title = f_title
            vc.f_first_name = f_first_name
            vc.f_middle_name = f_middle_name
            vc.f_last_name = f_last_name
            vc.f_gender = f_gender
            vc.f_dob = f_dob
        }
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
    
    // MARK: - get dob function
    @IBAction func get_dob(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let strDate = dateFormatter.string(from: dob.date)
        f_dob=strDate
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
