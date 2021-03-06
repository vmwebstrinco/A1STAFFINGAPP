//
//  MainEditViewController.swift
//  A1STAFFING
//
//  Created by Kalakcika Dinesh on 4/23/18.
//  Copyright © 2018 VMEWBS ENTERPRISE LTD. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import GooglePlacesSearchController


class MainEditViewController: UIViewController ,UITextFieldDelegate {
    
    let GoogleMapsAPIServerKey = "AIzaSyDnWXEoM_64N78xUsprOZUJsrC_Os-iRhU"
    
    lazy var placesSearchController: GooglePlacesSearchController = {
        let controller = GooglePlacesSearchController(delegate: self as! GooglePlacesAutocompleteViewControllerDelegate,
              apiKey: GoogleMapsAPIServerKey,
              placeType: .address
        )
        return controller
    }()
    
    // MARK: - Variable Declarations
    var insertid : Int = 0
    
    //Mark: - struct emp
    struct gemp: Codable {
        let title: String
        let first_name: String
        let middle_name: String
        let last_name: String
        let gender: String
        let dob: String
        let main_phone: String
        let mobile: String
        let main_email: String
        let address: String
        let unit: String
        let city: String
        let postalcode: String
        let social_insurance: String
        let own_car: String
        let work_permit_number: String
        let valid_till: String
        let legal_right: String
        let hear_from: String
        
        private enum CodingKeys: String, CodingKey{
            case title
            case first_name
            case middle_name
            case last_name
            case gender
            case dob
            case main_phone
            case mobile
            case main_email
            case address
            case unit
            case city
            case postalcode
            case social_insurance
            case own_car
            case work_permit_number
            case valid_till
            case legal_right
            case hear_from            
        }
    }
    
    
    //MARK: - ERROR LABELS
    
    @IBOutlet weak var lbl_email_error: UILabel!
    @IBOutlet weak var lbl_dob_error: UILabel!    
    @IBOutlet weak var lbl_valid_till_error: UILabel!
    @IBOutlet weak var lbl_global_error: UILabel!
    
    // MARK: - VIEW Declarations
    @IBOutlet weak var personal_view: UIView!
    @IBOutlet weak var contact_view: UIView!
    @IBOutlet weak var other_view: UIView!
    
    // MARK: - Personal form Declarations
    @IBOutlet weak var txt_first_name: UITextField!
    @IBOutlet weak var txt_middle_name: UITextField!
    @IBOutlet weak var txt_last_name: UITextField!
    
    @IBOutlet weak var title_btn_mr: DLRadioButton!
    @IBOutlet weak var title_btn_miss: DLRadioButton!
    @IBOutlet weak var title_btn_mrs: DLRadioButton!
    
    @IBOutlet weak var gender_btn_male: DLRadioButton!
    @IBOutlet weak var gender_btn_female: DLRadioButton!
    
    @IBOutlet weak var dob: UIDatePicker!
    
    // MARK: - contact form Declarations
    @IBOutlet weak var txt_main_phone: UITextField!
    @IBOutlet weak var txt_mobile: UITextField!
    @IBOutlet weak var txt_email: UITextField!
    @IBOutlet weak var txt_address: UITextField!
    @IBOutlet weak var txt_unit: UITextField!
    @IBOutlet weak var txt_city: UITextField!
    @IBOutlet weak var txt_postal_code: UITextField!
    
    // MARK: - other form Declarations
    
    @IBOutlet weak var txt_social_insurance: UITextField!
    @IBOutlet weak var txt_work_permit_number: UITextField!
    @IBOutlet weak var txt_hear_from: UITextField!
    
    @IBOutlet weak var valid_till: UIDatePicker!
    
    @IBOutlet weak var yes_btn_own_car: DLRadioButton!
    @IBOutlet weak var no_btn_own_car: DLRadioButton!
    
    @IBOutlet weak var yes_btn_legal_right: DLRadioButton!
    @IBOutlet weak var no_btn_legal_right: DLRadioButton!
    
    
    //MARK: - Personal Variable Declaration
    
    var f_title : String = ""
    var f_first_name : String?
    var f_middle_name : String?
    var f_last_name : String?
    var f_gender : String = ""
    var f_dob : String = ""
    
    //MARK: - Contact Variable Declaration
    
    var f_main_phone : String?
    var f_mobile : String?
    var f_main_email : String?
    var f_address : String?
    var f_unit : String?
    var f_city : String?
    var f_postalcode : String?
    
    //MARK: - Other Variable Declaration
    
    var f_own_car : String = ""
    var f_social_insurance : String?
    var f_work_permit_number : String?
    var f_valid_until : String = ""
    var f_legal_right : String = ""
    var f_hear_from : String?
    
    //MARK: - GLOBAL VARIABLES
    
    var glob_flag: Bool = true
    var glob_error: String = ""
       
    
    //MARK: - ON load
    override func viewDidLoad() {
        self.txt_address.delegate = self
        let inserviceUrl = "http://a1staffing.ca/app/services.php"
        let inurl = URL(string: inserviceUrl)
        
        var request = URLRequest(url: inurl!)
        request.httpMethod = "POST"
        var dataString = "secretWord=455gh66ded"
        dataString = dataString + "&action=getmaindata"
        dataString = dataString + "&id=\(insertid)"
        
        let dataD = dataString.data(using: .utf8)
        
        let group = DispatchGroup()
        group.enter()
        let insertEntry = URLSession.shared.uploadTask(with:request, from: dataD, completionHandler: { (data, response, error) in
            if error != nil {
                DispatchQueue.main.async{
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
                    let emp = try decoder.decode(gemp.self, from: data)
                    
                    self.txt_first_name.text = emp.first_name
                    self.f_first_name=emp.first_name
                    
                    self.txt_middle_name.text = emp.middle_name
                    self.f_middle_name=emp.middle_name
                    
                    self.txt_last_name.text = emp.last_name
                    self.f_last_name=emp.last_name
                    
                    let title : String = emp.title
                    self.f_title=emp.title
                    if(title == "Mr"){
                        self.title_btn_mr.isSelected = true
                    }else if(title == "Mrs"){
                        self.title_btn_mrs.isSelected = true
                    }else if(title == "Miss"){
                        self.title_btn_miss.isSelected = true
                    }
                    
                    let gender : String = emp.gender
                    self.f_gender=emp.gender
                    if(gender == "male"){
                        self.gender_btn_male.isSelected = true
                    }else if(gender == "female"){
                        self.gender_btn_female.isSelected = true
                    }
                    
                    let own_car : String = emp.own_car
                    self.f_own_car=emp.own_car
                    if(own_car == "YES"){
                        self.yes_btn_own_car.isSelected = true
                    }else if(gender == "NO"){
                        self.no_btn_own_car.isSelected = true
                    }
                    
                    let legal_right : String = emp.legal_right
                    self.f_legal_right=emp.legal_right
                    if(legal_right == "YES"){
                        self.yes_btn_legal_right.isSelected = true
                    }else if(legal_right == "NO"){
                        self.no_btn_legal_right.isSelected = true
                    }
                    
                    self.txt_main_phone.text = emp.main_phone
                    self.f_main_phone=emp.main_phone
                    
                    self.txt_mobile.text = emp.mobile
                    self.f_mobile=emp.mobile
                    
                    self.txt_email.text = emp.main_email
                    self.f_main_email=emp.main_email
                    
                    self.txt_address.text = emp.address
                    self.f_address=emp.address
                    
                    self.txt_unit.text = emp.unit
                    self.f_unit=emp.unit
                    
                    self.txt_city.text = emp.city
                    self.f_city=emp.city
                    
                    self.txt_postal_code.text = emp.postalcode
                    self.f_postalcode=emp.postalcode
                    
                    self.txt_social_insurance.text = emp.social_insurance
                    self.f_social_insurance=emp.social_insurance
                    
                    self.txt_work_permit_number.text = emp.work_permit_number
                    self.f_work_permit_number=emp.work_permit_number
                    
                    self.txt_hear_from.text = emp.hear_from
                    self.f_hear_from=emp.hear_from
                    
                    self.f_dob=emp.dob
                    self.f_valid_until=emp.valid_till
                    
                } catch let err {
                    print("Err", err)
                }
                group.leave()
            }
        })
        insertEntry.resume()
        group.wait()
        super.viewDidLoad()
        self.hideKeyboard()
        
        let c_dob: NSCalendar = NSCalendar(calendarIdentifier:  .gregorian)!
        c_dob.timeZone = NSTimeZone(name: "UTC")! as TimeZone
        if(f_dob != ""){
            let dob_arr = f_dob.components(separatedBy: "-")
            let components1: NSDateComponents = NSDateComponents()
            components1.year = Int(dob_arr[0])!
            components1.month = Int(dob_arr[1])!
            components1.day = Int(dob_arr[2])!
            let defaultDate1: NSDate = c_dob.date(from: components1 as DateComponents)! as NSDate
            dob.date = defaultDate1 as Date
        }
        dob.datePickerMode = .date
        
        let c_valid_till: NSCalendar = NSCalendar(calendarIdentifier:  .gregorian)!
        c_valid_till.timeZone = NSTimeZone(name: "UTC")! as TimeZone
        if(f_valid_until != ""){
            let valid_arr = f_valid_until.components(separatedBy: "-")
            let components2: NSDateComponents = NSDateComponents()
            components2.year = Int(valid_arr[0])!
            components2.month = Int(valid_arr[1])!
            components2.day = Int(valid_arr[2])!
            let defaultDate2: NSDate = c_valid_till.date(from: components2 as DateComponents)! as NSDate
            valid_till.date = defaultDate2 as Date
        }
        valid_till.datePickerMode = .date
        
        personal_view.layer.borderWidth = 0.5
        personal_view.layer.borderColor = UIColor(red:0.93, green:0.93, blue:0.93, alpha:1.0).cgColor
        
        contact_view.layer.borderWidth = 0.5
        contact_view.layer.borderColor = UIColor(red:0.87, green:0.87, blue:0.87, alpha:1.0).cgColor
        
        other_view.layer.borderWidth = 0.5
        other_view.layer.borderColor = UIColor(red:0.93, green:0.93, blue:0.93, alpha:1.0).cgColor
        
        //MARK: - Personal view Declaration
        
        txt_first_name.setLeftPaddingPoints(15)
        txt_first_name.setRightPaddingPoints(15)
        
        txt_first_name.layer.shadowOpacity = 1.0;
        txt_first_name.layer.shadowRadius = 0.0;
        txt_first_name.layer.shadowColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0).cgColor;
        txt_first_name.layer.shadowOffset = CGSize(width: -5.0, height: 0.0);
        
        txt_middle_name.setLeftPaddingPoints(15)
        txt_middle_name.setRightPaddingPoints(15)
        
        txt_middle_name.layer.shadowOpacity = 1.0;
        txt_middle_name.layer.shadowRadius = 0.0;
        txt_middle_name.layer.shadowColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0).cgColor;
        txt_middle_name.layer.shadowOffset = CGSize(width: -5.0, height: 0.0);
        
        txt_last_name.setLeftPaddingPoints(15)
        txt_last_name.setRightPaddingPoints(15)
        
        txt_last_name.layer.shadowOpacity = 1.0;
        txt_last_name.layer.shadowRadius = 0.0;
        txt_last_name.layer.shadowColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0).cgColor;
        txt_last_name.layer.shadowOffset = CGSize(width: -5.0, height: 0.0);
    
        //MARK: - Contact view Declaration
        
        txt_main_phone.setLeftPaddingPoints(15)
        txt_main_phone.setRightPaddingPoints(15)
        
        txt_main_phone.layer.shadowOpacity = 1.0;
        txt_main_phone.layer.shadowRadius = 0.0;
        txt_main_phone.layer.shadowColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0).cgColor;
        txt_main_phone.layer.shadowOffset = CGSize(width: -5.0, height: 0.0);
        
        txt_mobile.setLeftPaddingPoints(15)
        txt_mobile.setRightPaddingPoints(15)
        
        txt_mobile.layer.shadowOpacity = 1.0;
        txt_mobile.layer.shadowRadius = 0.0;
        txt_mobile.layer.shadowColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0).cgColor;
        txt_mobile.layer.shadowOffset = CGSize(width: -5.0, height: 0.0);
        
        txt_email.setLeftPaddingPoints(15)
        txt_email.setRightPaddingPoints(15)
        
        txt_email.layer.shadowOpacity = 1.0;
        txt_email.layer.shadowRadius = 0.0;
        txt_email.layer.shadowColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0).cgColor;
        txt_email.layer.shadowOffset = CGSize(width: -5.0, height: 0.0);
        
        txt_address.setLeftPaddingPoints(15)
        txt_address.setRightPaddingPoints(15)
        
        txt_address.layer.shadowOpacity = 1.0;
        txt_address.layer.shadowRadius = 0.0;
        txt_address.layer.shadowColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0).cgColor;
        txt_address.layer.shadowOffset = CGSize(width: -5.0, height: 0.0);
        
        txt_unit.setLeftPaddingPoints(15)
        txt_unit.setRightPaddingPoints(15)
        
        txt_unit.layer.shadowOpacity = 1.0;
        txt_unit.layer.shadowRadius = 0.0;
        txt_unit.layer.shadowColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0).cgColor;
        txt_unit.layer.shadowOffset = CGSize(width: -5.0, height: 0.0);
        
        txt_city.setLeftPaddingPoints(15)
        txt_city.setRightPaddingPoints(15)
        
        txt_city.layer.shadowOpacity = 1.0;
        txt_city.layer.shadowRadius = 0.0;
        txt_city.layer.shadowColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0).cgColor;
        txt_city.layer.shadowOffset = CGSize(width: -5.0, height: 0.0);
        
        txt_postal_code.setLeftPaddingPoints(15)
        txt_postal_code.setRightPaddingPoints(15)
        
        txt_postal_code.layer.shadowOpacity = 1.0;
        txt_postal_code.layer.shadowRadius = 0.0;
        txt_postal_code.layer.shadowColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0).cgColor;
        txt_postal_code.layer.shadowOffset = CGSize(width: -5.0, height: 0.0);
        
        //MARK: - Other view Declaration
        
        txt_social_insurance.setLeftPaddingPoints(15)
        txt_social_insurance.setRightPaddingPoints(15)
        
        txt_social_insurance.layer.shadowOpacity = 1.0;
        txt_social_insurance.layer.shadowRadius = 0.0;
        txt_social_insurance.layer.shadowColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0).cgColor;
        txt_social_insurance.layer.shadowOffset = CGSize(width: -5.0, height: 0.0);
        
        txt_work_permit_number.setLeftPaddingPoints(15)
        txt_work_permit_number.setRightPaddingPoints(15)
        
        txt_work_permit_number.layer.shadowOpacity = 1.0;
        txt_work_permit_number.layer.shadowRadius = 0.0;
        txt_work_permit_number.layer.shadowColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0).cgColor;
        txt_work_permit_number.layer.shadowOffset = CGSize(width: -5.0, height: 0.0);
        
        txt_hear_from.setLeftPaddingPoints(15)
        txt_hear_from.setRightPaddingPoints(15)
        
        txt_hear_from.layer.shadowOpacity = 1.0;
        txt_hear_from.layer.shadowRadius = 0.0;
        txt_hear_from.layer.shadowColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0).cgColor;
        txt_hear_from.layer.shadowOffset = CGSize(width: -5.0, height: 0.0);        
    }
    
    
    //MARKL - Validates form
    public func validateform() -> Int{
        if(glob_flag){
            var in_flag = true
            let myColor = UIColor.red
            
           if(txt_first_name.text == ""){
                txt_first_name.layer.shadowOpacity = 1.0;
                txt_first_name.layer.shadowRadius = 0.0;
                txt_first_name.layer.shadowColor = UIColor(red:1.0, green:0.0, blue:0.0, alpha:1.0).cgColor;
                txt_first_name.layer.shadowOffset = CGSize(width: -5.0, height: 0.0);
                txt_first_name.layer.borderColor = myColor.cgColor
                txt_first_name.layer.borderWidth = 1.0
                
                glob_error = "First Name is Required"
                txt_first_name.becomeFirstResponder()
                in_flag = false
            }
            else if(txt_last_name.text == ""){
                txt_last_name.layer.shadowOpacity = 1.0;
                txt_last_name.layer.shadowRadius = 0.0;
                txt_last_name.layer.shadowColor = UIColor(red:1.0, green:0.0, blue:0.0, alpha:1.0).cgColor;
                txt_last_name.layer.shadowOffset = CGSize(width: -5.0, height: 0.0);
                txt_last_name.layer.borderColor = myColor.cgColor
                txt_last_name.layer.borderWidth = 1.0
                glob_error = "Last Name is Required"
                txt_last_name.becomeFirstResponder()
                in_flag = false
            }
            else if(txt_main_phone.text == ""){
                txt_main_phone.layer.shadowOpacity = 1.0;
                txt_main_phone.layer.shadowRadius = 0.0;
                txt_main_phone.layer.shadowColor = UIColor(red:1.0, green:0.0, blue:0.0, alpha:1.0).cgColor;
                txt_main_phone.layer.shadowOffset = CGSize(width: -5.0, height: 0.0);
                txt_main_phone.layer.borderColor = myColor.cgColor
                txt_main_phone.layer.borderWidth = 1.0
                glob_error = "Main Phone Number is Required"
                txt_main_phone.becomeFirstResponder()
                in_flag = false
            }
            else if(txt_address.text == ""){
                txt_address.layer.shadowOpacity = 1.0;
                txt_address.layer.shadowRadius = 0.0;
                txt_address.layer.shadowColor = UIColor(red:1.0, green:0.0, blue:0.0, alpha:1.0).cgColor;
                txt_address.layer.shadowOffset = CGSize(width: -5.0, height: 0.0);
                txt_address.layer.borderColor = myColor.cgColor
                txt_address.layer.borderWidth = 1.0
                glob_error = "Address is Required"
                in_flag = false
            }
            
            if(in_flag){
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
                
                f_unit = txt_unit.text
                if(f_unit == nil){
                    f_unit = ""
                }
                
                f_city = txt_city.text
                if(f_city == nil){
                    f_city = ""
                }
                
                f_postalcode = txt_postal_code.text
                if(f_postalcode == nil){
                    f_postalcode = ""
                }
                
                f_work_permit_number = txt_work_permit_number.text
                if(f_work_permit_number == nil){
                    f_work_permit_number = ""
                }
                
                f_social_insurance = txt_social_insurance.text
                if(f_social_insurance == nil){
                    f_social_insurance = ""
                }
                
                f_hear_from = txt_hear_from.text
                if(f_hear_from == nil){
                    f_hear_from = ""
                }
                
                if(f_first_name! != "" && f_last_name! != "" && f_main_phone! != "" && f_address! != ""){
                    if(!validateEmail(enteredEmail: txt_email.text!)){
                        glob_error = "Enter Valid Email Address"
                        lbl_global_error.text = glob_error
                        return 0
                    }else{
                        glob_error = ""
                        lbl_global_error.text = ""
                        return 1
                    }
                }else{
                    glob_error = "Please Fill All Required Fields"
                    lbl_global_error.text = glob_error
                    return 0
                }
            }else{
                lbl_global_error.text = glob_error
                return 0
            }
        }else{
            lbl_global_error.text = glob_error
            return 0
        }
    }
    
    // MARK: - show sgn function
    @IBAction func showsign(_ sender: Any) {
        if(validateform() == 0){
            if(glob_error == ""){
                glob_error = "Please Fill All Required Fields"
            }
            let alert = UIAlertController(title: "Alert", message: glob_error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if(validateform() == 1){
            self.performSegue(withIdentifier: "segue_to_work_from_mainedit", sender: self)
        }
    }
    
    
    //MARK: - perform segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_to_work_from_mainedit"{
            let inserviceUrl = "http://a1staffing.ca/app/services.php"
            let inurl = URL(string: inserviceUrl)
            
            var request = URLRequest(url: inurl!)
            request.httpMethod = "POST"
            var dataString = "secretWord=dfg5678y"
            dataString = dataString + "&action=updatemain"
            
            dataString = dataString + "&insertid=\(insertid)"
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
            dataString = dataString + "&unit=\(f_unit!)"
            dataString = dataString + "&city=\(f_city!)"
            dataString = dataString + "&postalcode=\(f_postalcode!)"
            dataString = dataString + "&own_car=\(f_own_car)"
            dataString = dataString + "&social_insurance=\(f_social_insurance!)"
            dataString = dataString + "&work_permit_number=\(f_work_permit_number!)"
            dataString = dataString + "&valid_till=\(f_valid_until)"
            dataString = dataString + "&legal_right=\(f_legal_right)"
            dataString = dataString + "&hear_from=\(f_hear_from!)"
            
            
            let dataD = dataString.data(using: .utf8)
            
            let group = DispatchGroup()
            group.enter()
            
            let insertEntry = URLSession.shared.uploadTask(with:request, from: dataD, completionHandler: { (data, response, error) in
                
                if error != nil {
                    DispatchQueue.main.async{
                        let alert = UIAlertController(title: "Please Try Again", message: "Looks like the connection to the server didn't work. Do you have Internet access?", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
                else
                {
                    group.leave()
                }
            })
            insertEntry.resume()
            
            group.wait()
            let vc = segue.destination as! WorkViewController
            vc.insertid = insertid
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
        
        let cdate = dateFormatter.string(from: Date())
        let strDate = dateFormatter.string(from: dob.date)
        
        f_dob=strDate
        
        if(f_dob > cdate){
            lbl_dob_error.text="Select Valid Date"
            glob_flag = false
            glob_error = "Select Valid DOB"
        }else{
            glob_flag = true
            glob_error = ""
            lbl_dob_error.text=""
        }
    }
    
    // MARK: - get valid till function
    @IBAction func get_valid_till(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let cdate = dateFormatter.string(from: Date())
        let strDate = dateFormatter.string(from: valid_till.date)
        
        f_valid_until=strDate
        if(f_valid_until < cdate){
            lbl_valid_till_error.text="Select Valid Date"
            glob_flag = false
            glob_error = "Select Valid Date"
        }else{
            lbl_valid_till_error.text=""
            glob_flag = true
            glob_error = ""
        }
    }
    
    // MARK: - get own car function
    @IBAction func get_own_car(_ sender: DLRadioButton) {
        if(sender.tag == 1){
            f_own_car = "YES"
        }else if(sender.tag == 2){
            f_own_car = "NO"
        }
    }
    
    // MARK: - get legal rights function
    @IBAction func get_legal_rights(_ sender: DLRadioButton) {
        if(sender.tag == 1){
            f_legal_right = "YES"
        }else if(sender.tag == 2){
            f_legal_right = "NO"
        }
    }
    
    //EMAIL VALIDATION
    func validateEmail(enteredEmail:String) -> Bool {
        if(enteredEmail != ""){
            let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
            return emailPredicate.evaluate(with: enteredEmail)
        }else{
            return true
        }
    }
    
    @IBAction func email_validate(_ sender: Any) {
        if(!validateEmail(enteredEmail: txt_email.text!)){
            lbl_email_error.text="Enter Valid Email Address"
            glob_flag = false
            glob_error = "Enter Valid Email Address"
        }else{
            lbl_email_error.text=""
            glob_flag = true
            glob_error = ""
        }
    }
    
    func testFormat(sourcePhoneNumber: String) -> String {
        if let formattedPhoneNumber = format(phoneNumber: sourcePhoneNumber) {
            return formattedPhoneNumber
        }
        else {
            return "nil"
        }
    }
        
    @IBAction func phonenumberformat(_ sender: Any) {
        if(txt_main_phone.text != ""){
            let num = testFormat(sourcePhoneNumber: txt_main_phone.text!)
            if(num != "nil"){
                txt_main_phone.text=num
                glob_flag = true
                glob_error = ""
            }else{
                glob_flag = false
                glob_error = "Invalid Main Phone Number"
                txt_main_phone.text=""
                
                let alert = UIAlertController(title: "Alert", message: glob_error, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }else{
            glob_flag = true
            glob_error = ""
        }
    }
    
    @IBAction func mobilenumberformat(_ sender: Any) {
        if(txt_mobile.text != ""){
            let num = testFormat(sourcePhoneNumber: txt_mobile.text!)
            if(num != "nil"){
                txt_mobile.text=num
                glob_flag = true
                glob_error = ""
            }else{
                glob_flag = false
                glob_error = "Invalid Mobile Number"
                txt_mobile.text=""
                
                let alert = UIAlertController(title: "Alert", message: glob_error, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }else{
            glob_flag = true
            glob_error = ""
        }
    }
    
    func testsinFormat(sourceSinNumber: String) -> String {
        if let formattedSinNumber = sinformat(sinNumber: sourceSinNumber) {
            return formattedSinNumber
        }
        else {
            return "nil"
        }
    }    
    
    @IBAction func sinnumberformat(_ sender: Any) {
        if(txt_social_insurance.text != ""){
            let num = testsinFormat(sourceSinNumber: txt_social_insurance.text!)
            if(num != "nil"){
                txt_social_insurance.text=num
                glob_flag = true
                glob_error = ""
            }else{
                glob_flag = false
                glob_error = "Invalid SIN Number"
                txt_social_insurance.text=""
                
                let alert = UIAlertController(title: "Alert", message: glob_error, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }else{
            glob_flag = true
            glob_error = ""
        }
    }
    
    @IBAction func getaddressplaces(_ sender: UITextField) {
        self.present(placesSearchController, animated: true, completion: nil)
    }
}

extension MainEditViewController: GooglePlacesAutocompleteViewControllerDelegate {
    public func viewController(didAutocompleteWith place: PlaceDetails) {
        txt_address.text=place.formattedAddress
        txt_city.text = place.locality
        txt_postal_code.text = place.postalCode
        placesSearchController.isActive = false
    }
}
