//
//  WorkViewController.swift
//  A1STAFFING
//
//  Created by Kalakcika Dinesh on 4/21/18.
//  Copyright © 2018 VMEWBS ENTERPRISE LTD. All rights reserved.
//

import UIKit

class WorkViewController: UIViewController {
    // MARK: - Variable Declarations
    var insertid : Int = 0
    
    
    // MARK: - VIEW Declarations
    @IBOutlet weak var work_view: UIView!
    @IBOutlet weak var previous_view: UIView!
    
    
    // MARK: - Work form Declarations
    
    @IBOutlet weak var txt_km_range: UITextField!
    @IBOutlet weak var txt_major_intersection: UITextField!
    @IBOutlet weak var txt_other_certificates: UITextField!
    
    @IBOutlet weak var btn_day: DLRadioButton!
    
    @IBOutlet weak var btn_areas: DLRadioButton!
    
    // MARK: - Previous form Declarations
    
    @IBOutlet weak var txt_last_employer: UITextField!
    @IBOutlet weak var txt_previous_telephone: UITextField!
    @IBOutlet weak var txt_previous_address: UITextField!
    @IBOutlet weak var txt_position_held: UITextField!
    @IBOutlet weak var txt_salary: UITextField!
    
    @IBOutlet weak var work_from: UIDatePicker!
    @IBOutlet weak var work_to: UIDatePicker!        
    
    @IBOutlet weak var txt_reason_for_leaving: UITextField!
    @IBOutlet weak var txt_supervisor: UITextField!
    @IBOutlet weak var txt_emergency_number: UITextField!
    @IBOutlet weak var txt_any_other_emp: UITextField!
    @IBOutlet weak var txt_agency_name: UITextField!
    @IBOutlet weak var txt_list_jobs: UITextField!
    
   
    
    // MARK: - Work Variable Declarations
    
    var f_category : String = ""
    var f_kmrange: String?
    
    var f_days: String = ""
    var f_afternoon: String = ""
    var f_nights: String = ""
    var f_weekends: String = ""
    var f_overtime: String = ""
    var f_twelve_shift: String = ""
    
    var f_major_intersection: String?
    var f_steel_toed : String = ""
    var f_english_speak : String = ""
    var f_english_read : String = ""
    var f_english_write : String = ""
    var f_english_understand : String = ""
    var f_areas_exp : String = ""
    var f_days_avail : String = ""
    
    var f_whmis_cer : String = ""
    var f_hs_cer : String = ""
    var f_st_cer : String = ""
    var f_other_cer: String?
    
    // MARK: - Previous Variable Declarations
    
    var f_pre1_name: String?
    var f_pre1_tel: String?
    var f_pre1_address: String?
    var f_pre1_position: String?
    var f_pre1_salary: String?
    var f_pre1_from: String = ""
    var f_pre1_to: String = ""
    var f_pre1_reason: String?
    var f_pre1_supervisor: String?

    var f_emergency_notify: String?
    var f_criminal_pardon : String = ""
    var f_other_form: String?
    var f_temp_service : String = ""
    var f_name_of_agency: String?
    var f_jobs_sent: String?
       
    
    //MARKL - View onload function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - View Declaration
        
        btn_day.isMultipleSelectionEnabled = true
        btn_areas.isMultipleSelectionEnabled = true
        
        work_view.layer.borderWidth = 0.5
        work_view.layer.borderColor = UIColor(red:0.93, green:0.93, blue:0.93, alpha:1.0).cgColor
        
        previous_view.layer.borderWidth = 0.5
        previous_view.layer.borderColor = UIColor(red:0.87, green:0.87, blue:0.87, alpha:1.0).cgColor
       
        //MARK: - Personal view Declaration
        
        txt_km_range.setLeftPaddingPoints(15)
        txt_km_range.setRightPaddingPoints(15)
        
        txt_km_range.layer.shadowOpacity = 1.0;
        txt_km_range.layer.shadowRadius = 0.0;
        txt_km_range.layer.shadowColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0).cgColor;
        txt_km_range.layer.shadowOffset = CGSize(width: -5.0, height: 0.0);
        
        txt_major_intersection.setLeftPaddingPoints(15)
        txt_major_intersection.setRightPaddingPoints(15)
        
        txt_major_intersection.layer.shadowOpacity = 1.0;
        txt_major_intersection.layer.shadowRadius = 0.0;
        txt_major_intersection.layer.shadowColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0).cgColor;
        txt_major_intersection.layer.shadowOffset = CGSize(width: -5.0, height: 0.0);
        
        
        txt_other_certificates.setLeftPaddingPoints(15)
        txt_other_certificates.setRightPaddingPoints(15)
        
        txt_other_certificates.layer.shadowOpacity = 1.0;
        txt_other_certificates.layer.shadowRadius = 0.0;
        txt_other_certificates.layer.shadowColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0).cgColor;
        txt_other_certificates.layer.shadowOffset = CGSize(width: -5.0, height: 0.0);
        
        txt_last_employer.setLeftPaddingPoints(15)
        txt_last_employer.setRightPaddingPoints(15)
        
        txt_last_employer.layer.shadowOpacity = 1.0;
        txt_last_employer.layer.shadowRadius = 0.0;
        txt_last_employer.layer.shadowColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0).cgColor;
        txt_last_employer.layer.shadowOffset = CGSize(width: -5.0, height: 0.0);
        
        txt_previous_telephone.setLeftPaddingPoints(15)
        txt_previous_telephone.setRightPaddingPoints(15)
        
        txt_previous_telephone.layer.shadowOpacity = 1.0;
        txt_previous_telephone.layer.shadowRadius = 0.0;
        txt_previous_telephone.layer.shadowColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0).cgColor;
        txt_previous_telephone.layer.shadowOffset = CGSize(width: -5.0, height: 0.0);
        
        
        txt_previous_address.setLeftPaddingPoints(15)
        txt_previous_address.setRightPaddingPoints(15)
        
        txt_previous_address.layer.shadowOpacity = 1.0;
        txt_previous_address.layer.shadowRadius = 0.0;
        txt_previous_address.layer.shadowColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0).cgColor;
        txt_previous_address.layer.shadowOffset = CGSize(width: -5.0, height: 0.0);
        
        txt_position_held.setLeftPaddingPoints(15)
        txt_position_held.setRightPaddingPoints(15)
        
        txt_position_held.layer.shadowOpacity = 1.0;
        txt_position_held.layer.shadowRadius = 0.0;
        txt_position_held.layer.shadowColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0).cgColor;
        txt_position_held.layer.shadowOffset = CGSize(width: -5.0, height: 0.0);
        
        txt_salary.setLeftPaddingPoints(15)
        txt_salary.setRightPaddingPoints(15)
        
        txt_salary.layer.shadowOpacity = 1.0;
        txt_salary.layer.shadowRadius = 0.0;
        txt_salary.layer.shadowColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0).cgColor;
        txt_salary.layer.shadowOffset = CGSize(width: -5.0, height: 0.0);
        
        txt_reason_for_leaving.setLeftPaddingPoints(15)
        txt_reason_for_leaving.setRightPaddingPoints(15)
        
        txt_reason_for_leaving.layer.shadowOpacity = 1.0;
        txt_reason_for_leaving.layer.shadowRadius = 0.0;
        txt_reason_for_leaving.layer.shadowColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0).cgColor;
        txt_reason_for_leaving.layer.shadowOffset = CGSize(width: -5.0, height: 0.0);
        
        txt_supervisor.setLeftPaddingPoints(15)
        txt_supervisor.setRightPaddingPoints(15)
        
        txt_supervisor.layer.shadowOpacity = 1.0;
        txt_supervisor.layer.shadowRadius = 0.0;
        txt_supervisor.layer.shadowColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0).cgColor;
        txt_supervisor.layer.shadowOffset = CGSize(width: -5.0, height: 0.0);
        
        txt_emergency_number.setLeftPaddingPoints(15)
        txt_emergency_number.setRightPaddingPoints(15)
        
        txt_emergency_number.layer.shadowOpacity = 1.0;
        txt_emergency_number.layer.shadowRadius = 0.0;
        txt_emergency_number.layer.shadowColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0).cgColor;
        txt_emergency_number.layer.shadowOffset = CGSize(width: -5.0, height: 0.0);
        
        txt_any_other_emp.setLeftPaddingPoints(15)
        txt_any_other_emp.setRightPaddingPoints(15)
        
        txt_any_other_emp.layer.shadowOpacity = 1.0;
        txt_any_other_emp.layer.shadowRadius = 0.0;
        txt_any_other_emp.layer.shadowColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0).cgColor;
        txt_any_other_emp.layer.shadowOffset = CGSize(width: -5.0, height: 0.0);
        
        txt_agency_name.setLeftPaddingPoints(15)
        txt_agency_name.setRightPaddingPoints(15)
        
        txt_agency_name.layer.shadowOpacity = 1.0;
        txt_agency_name.layer.shadowRadius = 0.0;
        txt_agency_name.layer.shadowColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0).cgColor;
        txt_agency_name.layer.shadowOffset = CGSize(width: -5.0, height: 0.0);
        
        txt_list_jobs.setLeftPaddingPoints(15)
        txt_list_jobs.setRightPaddingPoints(15)
        
        txt_list_jobs.layer.shadowOpacity = 1.0;
        txt_list_jobs.layer.shadowRadius = 0.0;
        txt_list_jobs.layer.shadowColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0).cgColor;
        txt_list_jobs.layer.shadowOffset = CGSize(width: -5.0, height: 0.0);
        
        let valid1: NSCalendar = NSCalendar(calendarIdentifier:  .gregorian)!
        valid1.timeZone = NSTimeZone(name: "UTC")! as TimeZone
        work_from.datePickerMode = .date
        
        let valid2: NSCalendar = NSCalendar(calendarIdentifier:  .gregorian)!
        valid2.timeZone = NSTimeZone(name: "UTC")! as TimeZone
        work_to.datePickerMode = .date
    }
    
    
    //MARKL - Validates form
    public func validateform() -> Int{
        f_kmrange = txt_km_range.text
        if(f_kmrange == nil){
            f_kmrange = ""
        }
        
        f_major_intersection = txt_major_intersection.text
        if(f_major_intersection == nil){
            f_major_intersection = ""
        }
        
        f_other_cer = txt_other_certificates.text
        if(f_other_cer == nil){
            f_other_cer = ""
        }
        
        f_pre1_name = txt_last_employer.text
        if(f_pre1_name == nil){
            f_pre1_name = ""
        }
        
        f_pre1_tel = txt_previous_telephone.text
        if(f_pre1_tel == nil){
            f_pre1_tel = ""
        }
        
        
        f_pre1_address = txt_previous_address.text
        if(f_pre1_address == nil){
            f_pre1_address = ""
        }
        
        
        f_pre1_position = txt_position_held.text
        if(f_pre1_position == nil){
            f_pre1_position = ""
        }
        
        f_pre1_salary = txt_salary.text
        if(f_pre1_salary == nil){
            f_pre1_salary = ""
        }
        
        f_pre1_reason = txt_reason_for_leaving.text
        if(f_pre1_reason == nil){
            f_pre1_reason = ""
        }
        
        f_pre1_salary = txt_salary.text
        if(f_pre1_salary == nil){
            f_pre1_salary = ""
        }
        
        f_pre1_supervisor = txt_supervisor.text
        if(f_pre1_supervisor == nil){
            f_pre1_supervisor = ""
        }
        
        f_emergency_notify = txt_emergency_number.text
        if(f_emergency_notify == nil){
            f_emergency_notify = ""
        }
        
        f_other_form = txt_any_other_emp.text
        if(f_other_form == nil){
            f_other_form = ""
        }
        
        f_name_of_agency = txt_agency_name.text
        if(f_name_of_agency == nil){
            f_name_of_agency = ""
        }
        
        f_jobs_sent = txt_list_jobs.text
        if(f_jobs_sent == nil){
            f_jobs_sent = ""
        }
        
        
        if(f_kmrange! != "" && f_category != ""){
            return 1
        }else{
            return 0
        }
    }
    
    
    // MARK: - show sgn function
    @IBAction func showsign(_ sender: Any) {
        if(validateform() == 0){
            let alert = UIAlertController(title: "Alert", message: "Please fill all required fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if(validateform() == 1){
            self.performSegue(withIdentifier: "segue_to_sign_from_work", sender: self)
        }
    }
    
    
    //MARK: - perform segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_to_sign_from_work"{
            let inserviceUrl = "http://a1staffing.ca/app/services.php"
            let inurl = URL(string: inserviceUrl)
            
            var request = URLRequest(url: inurl!)
            request.httpMethod = "POST"
            var dataString = "secretWord=234fghyu"
            dataString = dataString + "&action=insertwork"
           
            dataString = dataString + "&insertid=\(insertid)"
            dataString = dataString + "&category=\(f_category)"
            dataString = dataString + "&kmrange=\(f_kmrange!)"
            dataString = dataString + "&days=\(f_days)"
            dataString = dataString + "&afternoon=\(f_afternoon)"
            dataString = dataString + "&nights=\(f_nights)"
            dataString = dataString + "&weekends=\(f_weekends)"
            dataString = dataString + "&overtime=\(f_overtime)"
            dataString = dataString + "&twelve_shift=\(f_twelve_shift)"
            dataString = dataString + "&major_intersection=\(f_major_intersection!)"
            dataString = dataString + "&steel_toed=\(f_steel_toed)"
            dataString = dataString + "&english_speak=\(f_english_speak)"
            dataString = dataString + "&english_read=\(f_english_read)"
            dataString = dataString + "&english_write=\(f_english_write)"
            dataString = dataString + "&english_understand=\(f_english_understand)"
            dataString = dataString + "&areas_exp=\(f_areas_exp)"
            dataString = dataString + "&days_avail=\(f_days_avail)"
            dataString = dataString + "&whmis_cer=\(f_whmis_cer)"
            dataString = dataString + "&hs_cer=\(f_hs_cer)"
            dataString = dataString + "&st_cer=\(f_st_cer)"
            dataString = dataString + "&other_cer=\(f_other_cer!)"
            dataString = dataString + "&pre1_name=\(f_pre1_name!)"
            dataString = dataString + "&pre1_tel=\(f_pre1_tel!)"
            dataString = dataString + "&pre1_address=\(f_pre1_address!)"
            dataString = dataString + "&pre1_position=\(f_pre1_position!)"
            dataString = dataString + "&pre1_salary=\(f_pre1_salary!)"
            dataString = dataString + "&pre1_from=\(f_pre1_from)"
            dataString = dataString + "&pre1_to=\(f_pre1_to)"
            dataString = dataString + "&pre1_reason=\(f_pre1_reason!)"
            dataString = dataString + "&pre1_supervisor=\(f_pre1_supervisor!)"
            dataString = dataString + "&emergency_notify=\(f_emergency_notify!)"
            dataString = dataString + "&criminal_pardon=\(f_criminal_pardon)"
            dataString = dataString + "&other_form=\(f_other_form!)"
            dataString = dataString + "&temp_service=\(f_temp_service)"
            dataString = dataString + "&name_of_agency=\(f_name_of_agency!)"
            dataString = dataString + "&jobs_sent=\(f_jobs_sent!)"
            
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
            let vc = segue.destination as! SignViewController
            vc.insertid = insertid
        }
    }

    
    
    // MARK: - Get category function
    @IBAction func get_category(_ sender: DLRadioButton) {
        if(sender.tag == 1){
            f_category = "Full Time"
        }else if(sender.tag == 2){
            f_category = "Part Time"
        }
    }
    
    // MARK: - Get Days function
    @IBAction func get_days(_ sender: DLRadioButton) {
        if(sender.tag == 1){
            f_days = "YES"
        }
    }
    
    // MARK: - Get Afternoon function
    @IBAction func get_afternoon(_ sender: DLRadioButton) {
        if(sender.tag == 1){
            f_afternoon = "YES"
        }
    }
    
    // MARK: - Get nights function
    @IBAction func get_nights(_ sender: DLRadioButton) {
        if(sender.tag == 1){
            f_nights = "YES"
        }
    }
    
    // MARK: - Get weekends function
    @IBAction func get_weekends(_ sender: DLRadioButton) {
        if(sender.tag == 1){
            f_weekends = "YES"
        }else if(sender.tag == 2){
            f_weekends = "NO"
        }
    }
    
    // MARK: - Get overtime function
    @IBAction func get_overtime(_ sender: DLRadioButton) {
        if(sender.tag == 1){
            f_overtime = "YES"
        }else if(sender.tag == 2){
            f_overtime = "NO"
        }
    }
    
    // MARK: - Get twelve function
    @IBAction func get_twelve(_ sender: DLRadioButton) {
        if(sender.tag == 1){
            f_twelve_shift = "YES"
        }else if(sender.tag == 2){
            f_twelve_shift = "NO"
        }
    }
    
    
    // MARK: - Get steel function
    @IBAction func get_steel(_ sender: DLRadioButton) {
        if(sender.tag == 1){
            f_steel_toed = "YES"
        }else if(sender.tag == 2){
            f_steel_toed = "NO"
        }
    }
    
    // MARK: - Get english speak function
    @IBAction func get_englishspeak(_ sender: DLRadioButton) {
        if(sender.tag == 1){
            f_english_speak = "YES"
        }
    }
    
    
    // MARK: - Get read function
    @IBAction func get_read(_ sender: DLRadioButton) {
        if(sender.tag == 1){
            f_english_read = "YES"
        }
    }
    
    // MARK: - Get write function
    @IBAction func get_write(_ sender: DLRadioButton) {
        if(sender.tag == 1){
            f_english_write = "YES"
        }
    }
    
    
    // MARK: - Get understand function
    @IBAction func get_understand(_ sender: DLRadioButton) {
        if(sender.tag == 1){
            f_english_understand = "YES"
        }
    }
    
    // MARK: - Get whmis function
    @IBAction func get_whmis(_ sender: DLRadioButton) {
        if(sender.tag == 1){
            f_whmis_cer = "YES"
        }
    }
    
    
    // MARK: - Get hs function
    @IBAction func get_hs(_ sender: DLRadioButton) {
        if(sender.tag == 1){
            f_hs_cer = "YES"
        }
    }
    
    // MARK: - Get st function
    @IBAction func get_st(_ sender: DLRadioButton) {
        if(sender.tag == 1){
            f_st_cer = "YES"
        }
    }    
    
    // MARK: - Get criminal function
    @IBAction func get_criminal(_ sender: DLRadioButton) {
        if(sender.tag == 1){
            f_criminal_pardon = "YES"
        }else if(sender.tag == 2){
            f_criminal_pardon = "NO"
        }
    }
    
    // MARK: - Get temp service function
    @IBAction func get_tempservice(_ sender: DLRadioButton) {
        if(sender.tag == 1){
            f_temp_service = "YES"
        }else if(sender.tag == 2){
            f_temp_service = "NO"
        }
    }
    
    // MARK: - Get days function
    @IBAction func get_days_available(_ sender: DLRadioButton) {
        if(sender.tag == 1){
            if(f_days_avail != ""){
                f_days_avail+=",";
            }
            f_days_avail += "MON"
        }else if(sender.tag == 2){
            if(f_days_avail != ""){
                f_days_avail+=",";
            }
            f_days_avail += "TUES"
        }else if(sender.tag == 3){
            if(f_days_avail != ""){
                f_days_avail+=",";
            }
            f_days_avail += "WED"
        }else if(sender.tag == 4){
            if(f_days_avail != ""){
                f_days_avail+=",";
            }
            f_days_avail += "THURS"
        }else if(sender.tag == 5){
            if(f_days_avail != ""){
                f_days_avail+=",";
            }
            f_days_avail += "FRI"
        }else if(sender.tag == 6){
            if(f_days_avail != ""){
                f_days_avail+=",";
            }
            f_days_avail += "SAT"
        }else if(sender.tag == 7){
            if(f_days_avail != ""){
                f_days_avail+=",";
            }
            f_days_avail += "SUN"
        }
    }
    
    // MARK: - Get areas function
    @IBAction func get_areas_exp(_ sender: DLRadioButton) {
        if(sender.tag == 1){
            if(f_areas_exp != ""){
                f_areas_exp+=",";
            }
            f_areas_exp += "WAREHOUSE"
        }else if(sender.tag == 2){
            if(f_areas_exp != ""){
                f_areas_exp+=",";
            }
            f_areas_exp += "SHIP"
        }else if(sender.tag == 3){
            if(f_areas_exp != ""){
                f_areas_exp+=",";
            }
            f_areas_exp += "FORKLIFT"
        }else if(sender.tag == 4){
            if(f_areas_exp != ""){
                f_areas_exp+=",";
            }
            f_areas_exp += "ASSEMBLY"
        }else if(sender.tag == 5){
            if(f_areas_exp != ""){
                f_areas_exp+=",";
            }
            f_areas_exp += "INVENTORY"
        }else if(sender.tag == 6){
            if(f_areas_exp != ""){
                f_areas_exp+=",";
            }
            f_areas_exp += "MACHINEOPERTAION"
        }else if(sender.tag == 7){
            if(f_areas_exp != ""){
                f_areas_exp+=",";
            }
            f_areas_exp += "HEAVYLIFTING"
        }else if(sender.tag == 8){
            if(f_areas_exp != ""){
                f_areas_exp+=",";
            }
            f_areas_exp += "PACKING"
        }else if(sender.tag == 9){
            if(f_areas_exp != ""){
                f_areas_exp+=",";
            }
            f_areas_exp += "ORDERPICKING"
        }else if(sender.tag == 10){
            if(f_areas_exp != ""){
                f_areas_exp+=",";
            }
            f_areas_exp += "WELDING"
        }
        
        let alert = UIAlertController(title: "AREAS", message: f_areas_exp, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - get from function
    @IBAction func get_from(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let strDate = dateFormatter.string(from: work_from.date)
        f_pre1_from=strDate
    }
    
    // MARK: - get to function
    @IBAction func get_to(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let strDate = dateFormatter.string(from: work_to.date)
        f_pre1_to=strDate
    }
}
