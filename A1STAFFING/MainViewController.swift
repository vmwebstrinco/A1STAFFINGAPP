//
//  MainViewController.swift
//  A1STAFFING
//
//  Created by Kalakchika Sivarasa on 2018-02-18.
//  Copyright © 2018 VMEWBS ENTERPRISE LTD. All rights reserved.
//

import UIKit
var insertid : Int = 0

class MainViewController: UIViewController {
    // MARK: - Variable Declarations
    
    //Mark: - struct
    struct cemp: Codable {
        let id: Int
        
        private enum CodingKeys: String, CodingKey{
            case id
        }
      
    }
        
    // MARK: - VIEW Declarations
    @IBOutlet weak var personal_view: UIView!
    @IBOutlet weak var contact_view: UIView!
    @IBOutlet weak var other_view: UIView!
    
    // MARK: - Personal fomr Declarations
    @IBOutlet weak var txt_first_name: UITextField!
    @IBOutlet weak var txt_middle_name: UITextField!
    @IBOutlet weak var txt_last_name: UITextField!
    
    @IBOutlet weak var title_btn_mr: DLRadioButton!
    @IBOutlet weak var title_btn_miss: DLRadioButton!
    @IBOutlet weak var title_btn_mrs: DLRadioButton!
    
    @IBOutlet weak var gender_btn_male: DLRadioButton!
    @IBOutlet weak var gender_btn_female: DLRadioButton!
    
    @IBOutlet weak var dob: UIDatePicker!
    
    // MARK: - contact fomr Declarations
    @IBOutlet weak var txt_main_phone: UITextField!
    @IBOutlet weak var txt_mobile: UITextField!
    @IBOutlet weak var txt_email: UITextField!
    @IBOutlet weak var txt_social_insurance: UITextField!
    @IBOutlet weak var txt_address: UITextField!
    
    // MARK: - other fomr Declarations
    @IBOutlet weak var work_type_full: DLRadioButton!
    @IBOutlet weak var work_type_part: DLRadioButton!    
    @IBOutlet weak var txt_km_range: UITextField!
    
    
    //1
    var f_title : String = ""
    var f_first_name : String?
    var f_middle_name : String?
    var f_last_name : String?
    var f_gender : String = ""
    var f_dob : String = ""
    
    //2
    var f_main_phone : String?
    var f_mobile : String?
    var f_main_email : String?
    var f_address : String?
    var f_social_insurance : String?
    
    //3
    var f_category : String = ""
    var f_kmrange: String?
    
    
    //MARK: - ON load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personal_view.layer.borderWidth = 0.5
        personal_view.layer.borderColor = UIColor.black.cgColor
        
        contact_view.layer.borderWidth = 0.5
        contact_view.layer.borderColor = UIColor.black.cgColor
        
        other_view.layer.borderWidth = 0.5
        other_view.layer.borderColor = UIColor.black.cgColor
        
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
        
        txt_km_range.setLeftPaddingPoints(10)
        txt_km_range.setRightPaddingPoints(10)
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
        
        f_kmrange = txt_km_range.text
        if(f_kmrange == nil){
            f_kmrange = ""
        }
        
        
        if(f_first_name! != "" && f_last_name! != "" && f_title != "" && f_gender != "" && f_dob != "" && f_main_phone! != "" && f_address! != "" && f_kmrange! != "" && f_category != ""){
            return 1
        }else{
            return 0
        }
    }
    
    // MARK: - show sgn function
    @IBAction func showsign(_ sender: Any) {
         var inflag : Bool = true
        if(validateform() == 0){
            inflag = false
            let alert = UIAlertController(title: "Alert", message: "Please fill all required fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if(validateform() == 1){
            
            let inserviceUrl = "http://a1staffing.ca/app/services.php"
            let inurl = URL(string: inserviceUrl)
            
            var request = URLRequest(url: inurl!)
            request.httpMethod = "POST"
            var dataString = "secretWord=44fdcv8jf3"
            dataString = dataString + "&action=insert"
            
            dataString = dataString + "&title=\(f_title)"
            dataString = dataString + "&first_name=\(f_first_name!)"
            dataString = dataString + "&middle_name=\(f_middle_name!)"
            dataString = dataString + "&last_name=\(f_last_name!)"
            dataString = dataString + "&gender=\(f_gender)"
            dataString = dataString + "&dob=\(f_dob)"
            dataString = dataString + "&main_phone=\(f_main_phone!)"
            dataString = dataString + "&mobile=\(f_mobile!)"
            dataString = dataString + "&main_email=\(f_main_email!)"
            dataString = dataString + "&address=\(f_address!)"
            dataString = dataString + "&social_insurance=\(f_social_insurance!)"
            dataString = dataString + "&category=\(f_category)"
            dataString = dataString + "&kmrange=\(f_kmrange!)"
            
            let dataD = dataString.data(using: .utf8)
            
            let insertEntry = URLSession.shared.uploadTask(with:request, from: dataD, completionHandler: { (data, response, error) in
                
                if error != nil {
                    inflag =  false
                    DispatchQueue.main.async
                        {
                            let alert = UIAlertController(title: "Please Try Again", message: "Looks like the connection to the server didn't work. Do you have Internet access?", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        }
                }
                else
                {
                    guard let data = data else { return }
                    do {
                        let decoder = JSONDecoder()
                        let emp = try decoder.decode(cemp.self, from: data)
                        insertid = emp.id
                        print(insertid)
                        print("BREAK")
                        
                    } catch let err {
                        inflag = false
                        print("Err", err)
                    }
                    
                }
            })
            insertEntry.resume()
            
            performSegue(withIdentifier: "seqtosign", sender: self)
        }
    }
    
    
    //MARK: - perform segue    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seqtosign"{
            let vc = segue.destination as! SignViewController
            vc.insertid = insertid
            print(insertid)
            
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
    
    // MARK: - Get category function
    @IBAction func get_category(_ sender: DLRadioButton) {
        if(sender.tag == 1){
            f_category = "Full Time"
        }else if(sender.tag == 2){
            f_category = "Part Time"
        }
    }
}
