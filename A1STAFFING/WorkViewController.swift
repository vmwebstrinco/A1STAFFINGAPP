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
    
    //Mark: - struct emp
    struct gemp: Codable {       
        let category: String
        let kmrange: String
        let days: String
        let afternoon: String
        let nights: String
        let weekends: String
        let overtime: String
        let twelve_shift: String
        let steel_toed: String
        let english_speak: String
        let english_read: String
        let english_write: String
        let english_understand: String
        let areas_exp: String
        let days_avail: String
        let whmis_cer: String
        let hs_cer: String
        let st_cer: String
        let other_cer: String
        let pre1_name: String
        let pre1_tel: String
        let pre1_address: String
        let pre1_position: String
        let pre1_salary: String
        let pre1_duration: String
        let pre1_reason: String
        let pre1_supervisor: String
        let emergency_name: String
        let emergency_phone: String
        let criminal_pardon: String
        let other_form: String
        let temp_service: String
        let name_of_agency: String
        let jobs_sent: String
        
        private enum CodingKeys: String, CodingKey{
            case category
            case kmrange
            case days
            case afternoon
            case nights
            case weekends
            case overtime
            case twelve_shift
            case steel_toed
            case english_speak
            case english_read
            case english_write
            case english_understand
            case areas_exp
            case days_avail
            case whmis_cer
            case hs_cer
            case st_cer
            case other_cer
            case pre1_name
            case pre1_tel
            case pre1_address
            case pre1_position
            case pre1_salary
            case pre1_duration
            case pre1_reason
            case pre1_supervisor
            case emergency_name
            case emergency_phone
            case criminal_pardon
            case other_form
            case temp_service
            case name_of_agency
            case jobs_sent
        }
    }
    
    @IBOutlet weak var lbl_glob_error: UILabel!
    
    // MARK: - VIEW Declarations
    @IBOutlet weak var work_view: UIView!
    @IBOutlet weak var previous_view: UIView!
    
    
    // MARK: - Work form Declarations
    
    @IBOutlet weak var btn_km_30: DLRadioButton!
    @IBOutlet weak var btn_km_40: DLRadioButton!
    @IBOutlet weak var btn_km_50: DLRadioButton!
    @IBOutlet weak var btn_km_60: DLRadioButton!
    
    @IBOutlet weak var txt_other_certificates: UITextField!
    
    @IBOutlet weak var btn_full_time: DLRadioButton!
    @IBOutlet weak var btn_part_time: DLRadioButton!
    
    @IBOutlet weak var btn_days: DLRadioButton!
    @IBOutlet weak var btn_afternoon: DLRadioButton!
    @IBOutlet weak var btn_nights: DLRadioButton!
    
    @IBOutlet weak var btn_week_yes: DLRadioButton!
    @IBOutlet weak var btn_week_no: DLRadioButton!
    
    @IBOutlet weak var btn_over_yes: DLRadioButton!
    @IBOutlet weak var btn_over_no: DLRadioButton!
    
    @IBOutlet weak var btn_twelve_yes: DLRadioButton!
    @IBOutlet weak var btn_twelve_no: DLRadioButton!
    
    @IBOutlet weak var btn_steel_yes: DLRadioButton!
    @IBOutlet weak var btn_steel_no: DLRadioButton!
    
    @IBOutlet weak var btn_english_speak: DLRadioButton!
    @IBOutlet weak var btn_english_read: DLRadioButton!
    @IBOutlet weak var btn_english_write: DLRadioButton!
    @IBOutlet weak var btn_english_understand: DLRadioButton!
    
    @IBOutlet weak var btn_warehouse: DLRadioButton!
    @IBOutlet weak var btn_ship: DLRadioButton!
    @IBOutlet weak var btn_forklif: DLRadioButton!
    @IBOutlet weak var btn_assembly: DLRadioButton!
    @IBOutlet weak var btn_inventory: DLRadioButton!
    @IBOutlet weak var btn_machine: DLRadioButton!
    @IBOutlet weak var btn_heavy: DLRadioButton!
    @IBOutlet weak var btn_packing: DLRadioButton!
    @IBOutlet weak var btn_order: DLRadioButton!
    @IBOutlet weak var btn_welding: DLRadioButton!
    
    @IBOutlet weak var btn_monday: DLRadioButton!
    @IBOutlet weak var btn_tuesday: DLRadioButton!
    @IBOutlet weak var btn_wednesday: DLRadioButton!
    @IBOutlet weak var btn_thursday: DLRadioButton!
    @IBOutlet weak var btn_friday: DLRadioButton!
    @IBOutlet weak var btn_saturday: DLRadioButton!
    @IBOutlet weak var btn_sunday: DLRadioButton!
    @IBOutlet weak var btn_all_days: DLRadioButton!
    
    @IBOutlet weak var btn_whms: DLRadioButton!
    @IBOutlet weak var btn_h2s: DLRadioButton!
    @IBOutlet weak var btn_stjohns: DLRadioButton!
    
    @IBOutlet weak var btn_criminal_yes: DLRadioButton!
    @IBOutlet weak var btn_criminal_no: DLRadioButton!
    
    @IBOutlet weak var btn_temp_yes: DLRadioButton!
    @IBOutlet weak var btn_temp_no: DLRadioButton!    
    
    @IBOutlet weak var btn_day: DLRadioButton!
    @IBOutlet weak var btn_areas: DLRadioButton!
    
    @IBOutlet weak var btn_shifts_del: DLRadioButton!    
    @IBOutlet weak var btn_english_del: DLRadioButton!
    @IBOutlet weak var btn_cer_del: DLRadioButton!
    
    // MARK: - Previous form Declarations
    
    @IBOutlet weak var txt_last_employer: UITextField!
    @IBOutlet weak var txt_previous_telephone: UITextField!
    @IBOutlet weak var txt_previous_address: UITextField!
    @IBOutlet weak var txt_position_held: UITextField!
    @IBOutlet weak var txt_salary: UITextField!
    @IBOutlet weak var txt_pre1_duration : UITextField!
    
    @IBOutlet weak var txt_reason_for_leaving: UITextField!
    @IBOutlet weak var txt_supervisor: UITextField!
    @IBOutlet weak var txt_emergency_number: UITextField!
    @IBOutlet weak var txt_any_other_emp: UITextField!
    @IBOutlet weak var txt_agency_name: UITextField!
    @IBOutlet weak var txt_list_jobs: UITextField!
    @IBOutlet weak var txt_emergency_name : UITextField!
       
    // MARK: - Work Variable Declarations
    
    var f_category : String = ""
    var f_kmrange : String = ""
    
    var f_days: String = ""
    var f_afternoon: String = ""
    var f_nights: String = ""
    var f_weekends: String = ""
    var f_overtime: String = ""
    var f_twelve_shift: String = ""
    
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
    var f_pre1_reason: String?
    var f_pre1_supervisor: String?
    var f_pre1_duration: String?

    var f_emergency_name: String?
    var f_emergency_phone: String?
    var f_criminal_pardon : String = ""
    var f_other_form: String?
    var f_temp_service : String = ""
    var f_name_of_agency: String?
    var f_jobs_sent: String?
    
    //
    
    var s_work_till : String = ""
    var s_work_from : String = ""
    
    var glob_flag: Bool = true
    var glob_error: String = ""
       
    
    //MARKL - View onload function
    
    override func viewDidLoad() {
        btn_day.isMultipleSelectionEnabled = true
        btn_areas.isMultipleSelectionEnabled = true
        btn_shifts_del.isMultipleSelectionEnabled = true
        btn_english_del.isMultipleSelectionEnabled = true
        btn_cer_del.isMultipleSelectionEnabled = true
        
        let inserviceUrl = "http://a1staffing.ca/app/services.php"
        let inurl = URL(string: inserviceUrl)
        
        var request = URLRequest(url: inurl!)
        request.httpMethod = "POST"
        var dataString = "secretWord=345gt6768"
        dataString = dataString + "&action=getdata"
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
                    
                    self.txt_other_certificates.text = emp.other_cer
                    self.txt_pre1_duration.text = emp.pre1_duration
                    self.txt_last_employer.text = emp.pre1_name
                    self.txt_previous_telephone.text = emp.pre1_tel
                    self.txt_previous_address.text = emp.pre1_address
                    self.txt_position_held.text = emp.pre1_position
                    self.txt_salary.text = emp.pre1_salary
                    self.txt_reason_for_leaving.text = emp.pre1_reason
                    self.txt_supervisor.text = emp.pre1_supervisor
                    self.txt_emergency_name.text = emp.emergency_name
                    self.txt_emergency_number.text = emp.emergency_phone
                    self.txt_any_other_emp.text = emp.other_form
                    self.txt_agency_name.text = emp.name_of_agency
                    self.txt_list_jobs.text = emp.jobs_sent
                    
                    let category : String = emp.category
                    self.f_category=emp.category
                    if(category == "Full Time"){
                        self.btn_full_time.isSelected = true
                    }else if(category == "Part Time"){
                        self.btn_part_time.isSelected = true
                    }
                    
                    let kmrng : String = emp.kmrange
                    self.f_kmrange=emp.kmrange
                    if(kmrng == "30"){
                        self.btn_km_30.isSelected = true
                    }else if(kmrng == "40"){
                        self.btn_km_40.isSelected = true
                    }else if(kmrng == "50"){
                        self.btn_km_50.isSelected = true
                    }else if(kmrng == "60"){
                        self.btn_km_60.isSelected = true
                    }
                    
                    let days : String = emp.days
                    self.f_days=emp.days
                    if(days == "YES"){
                        self.btn_days.isSelected = true
                    }
                    
                    let afternoon : String = emp.afternoon
                    self.f_afternoon=emp.afternoon
                    if(afternoon == "YES"){
                        self.btn_afternoon.isSelected = true
                    }
                    
                    let nights : String = emp.nights
                    self.f_nights=emp.nights
                    if(nights == "YES"){
                        self.btn_nights.isSelected = true
                    }
                    
                    let weekends : String = emp.weekends
                    self.f_weekends=emp.weekends
                    if(weekends == "YES"){
                        self.btn_week_yes.isSelected = true
                    }else if(weekends == "NO"){
                        self.btn_week_no.isSelected = true
                    }
                    
                    let overtime : String = emp.overtime
                    self.f_overtime=emp.overtime
                    if(overtime == "YES"){
                        self.btn_over_yes.isSelected = true
                    }else if(overtime == "NO"){
                        self.btn_over_no.isSelected = true
                    }
                    
                    let twelve_shift : String = emp.twelve_shift
                    self.f_twelve_shift=emp.twelve_shift
                    if(twelve_shift == "YES"){
                        self.btn_twelve_yes.isSelected = true
                    }else if(twelve_shift == "NO"){
                        self.btn_twelve_no.isSelected = true
                    }
                    
                    let steel_toed : String = emp.steel_toed
                    self.f_steel_toed=emp.steel_toed
                    if(steel_toed == "YES"){
                        self.btn_steel_yes.isSelected = true
                    }else  if(steel_toed == "NO"){
                        self.btn_steel_no.isSelected = true
                    }
                    
                    let english_speak : String = emp.english_speak
                    self.f_english_speak=emp.english_speak
                    if(english_speak == "YES"){
                        self.btn_english_speak.isSelected = true
                    }
                    
                    let english_read : String = emp.english_read
                    self.f_english_read=emp.english_read
                    if(english_read == "YES"){
                        self.btn_english_read.isSelected = true
                    }
                    
                    let english_write : String = emp.english_write
                    self.f_english_write=emp.english_write
                    if(english_write == "YES"){
                        self.btn_english_write.isSelected = true
                    }
                    
                    let english_understand : String = emp.english_understand
                    self.f_english_understand=emp.english_understand
                    if(english_understand == "YES"){
                        self.btn_english_understand.isSelected = true
                    }
                    
                    let whmis_cer : String = emp.whmis_cer
                    self.f_whmis_cer=emp.whmis_cer
                    if(whmis_cer == "YES"){
                        self.btn_whms.isSelected = true
                    }
                    
                    let hs_cer : String = emp.hs_cer
                    self.f_hs_cer=emp.hs_cer
                    if(hs_cer == "YES"){
                        self.btn_h2s.isSelected = true
                    }
                    
                    let st_cer : String = emp.st_cer
                    self.f_st_cer=emp.st_cer
                    if(st_cer == "YES"){
                        self.btn_stjohns.isSelected = true
                    }
                    
                    let criminal_pardon : String = emp.criminal_pardon
                    self.f_criminal_pardon=emp.criminal_pardon
                    if(criminal_pardon == "YES"){
                        self.btn_criminal_yes.isSelected = true
                    }else if(criminal_pardon == "NO"){
                        self.btn_criminal_no.isSelected = true
                    }
                    
                    let temp_service : String = emp.temp_service
                    self.f_temp_service=emp.temp_service
                    if(temp_service == "YES"){
                        self.btn_temp_yes.isSelected = true
                    }else if(temp_service == "NO"){
                        self.btn_temp_no.isSelected = true
                    }
                    
                    
                    let areas_exp : String = emp.areas_exp
                    self.f_areas_exp=emp.areas_exp
                    if(areas_exp != ""){
                        let areasarr = areas_exp.components(separatedBy: ",")
                        for area in areasarr {
                            if area == "WAREHOUSE" {
                                self.btn_warehouse.isSelected = true
                            }else if area == "SHIP" {
                                self.btn_ship.isSelected = true
                            }else if area == "FORKLIFT" {
                                self.btn_forklif.isSelected = true
                            }else if area == "ASSEMBLY" {
                                self.btn_assembly.isSelected = true
                            }else if area == "INVENTORY" {
                                self.btn_inventory.isSelected = true
                            }else if area == "MACHINEOPERTAION" {
                                self.btn_machine.isSelected = true
                            }else if area == "HEAVYLIFTING" {
                                self.btn_heavy.isSelected = true
                            }else if area == "PACKING" {
                                self.btn_packing.isSelected = true
                            }else if area == "ORDERPICKING" {
                                self.btn_order.isSelected = true
                            }else if area == "WELDING" {
                                self.btn_welding.isSelected = true
                            }
                        }
                    }
                    
                    let days_avail : String = emp.days_avail
                    self.f_days_avail=emp.days_avail
                    if(days_avail != ""){
                        let days_availarr = days_avail.components(separatedBy: ",")
                        for day in days_availarr {
                            if day == "MON" {
                                self.btn_monday.isSelected = true
                            }else if day == "TUES" {
                                self.btn_tuesday.isSelected = true
                            }else if day == "WED" {
                                self.btn_wednesday.isSelected = true
                            }else if day == "THURS" {
                                self.btn_thursday.isSelected = true
                            }else if day == "FRI" {
                                self.btn_friday.isSelected = true
                            }else if day == "SAT" {
                                self.btn_saturday.isSelected = true
                            }else if day == "SUN" {
                                self.btn_sunday.isSelected = true
                            }
                        }
                        if(days_availarr.count == 7){
                            self.btn_all_days.isSelected = true
                        }
                    }
                    
                    
                } catch let err {
                    print("Err", err)
                }
                group.leave()
            }
        })
        insertEntry.resume()
        group.wait()
        
        super.viewDidLoad()
        
        //MARK: - View Declaration
        
        work_view.layer.borderWidth = 0.5
        work_view.layer.borderColor = UIColor(red:0.87, green:0.87, blue:0.87, alpha:1.0).cgColor
        
        previous_view.layer.borderWidth = 0.5
        previous_view.layer.borderColor = UIColor(red:0.87, green:0.87, blue:0.87, alpha:1.0).cgColor
       
        //MARK: - Personal view Declaration
        
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
        
        txt_emergency_name.setLeftPaddingPoints(15)
        txt_emergency_name.setRightPaddingPoints(15)
        
        txt_emergency_name.layer.shadowOpacity = 1.0;
        txt_emergency_name.layer.shadowRadius = 0.0;
        txt_emergency_name.layer.shadowColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0).cgColor;
        txt_emergency_name.layer.shadowOffset = CGSize(width: -5.0, height: 0.0);
        
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
        
        txt_pre1_duration.setLeftPaddingPoints(15)
        txt_pre1_duration.setRightPaddingPoints(15)
        
        txt_pre1_duration.layer.shadowOpacity = 1.0;
        txt_pre1_duration.layer.shadowRadius = 0.0;
        txt_pre1_duration.layer.shadowColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0).cgColor;
        txt_pre1_duration.layer.shadowOffset = CGSize(width: -5.0, height: 0.0);
    }
    
    
    //MARKL - Validates form
    public func validateform() -> Int{
        if(glob_flag){
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
            
            f_emergency_name = txt_emergency_name.text
            if(f_emergency_name == nil){
                f_emergency_name = ""
            }
            
            f_emergency_phone = txt_emergency_number.text
            if(f_emergency_phone == nil){
                f_emergency_phone = ""
            }
            
            f_pre1_duration = txt_pre1_duration.text
            if(f_pre1_duration == nil){
                f_pre1_duration = ""
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
            
            if(f_kmrange != "" && f_category != ""){
                glob_error = ""
                lbl_glob_error.text = ""
                return 1
            }else{
                glob_error = "Please Fill All Required Fields"
                lbl_glob_error.text = glob_error
                return 0
            }
        }else{
            lbl_glob_error.text = glob_error
            return 0
        }
    }
    
    
    // MARK: - show sgn function
    @IBAction func showsign(_ sender: Any) {
        if(validateform() == 0){
            let alert = UIAlertController(title: "Alert", message: glob_error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if(validateform() == 1){
            self.performSegue(withIdentifier: "segue_to_sign_from_work", sender: self)
        }
    }
    
    // MARK: - go back to main function
    @IBAction func showmainedit(_ sender: Any) {
        self.performSegue(withIdentifier: "segue_to_mainedit_from_work", sender: self)
        
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
            dataString = dataString + "&kmrange=\(f_kmrange)"
            dataString = dataString + "&days=\(f_days)"
            dataString = dataString + "&afternoon=\(f_afternoon)"
            dataString = dataString + "&nights=\(f_nights)"
            dataString = dataString + "&weekends=\(f_weekends)"
            dataString = dataString + "&overtime=\(f_overtime)"
            dataString = dataString + "&twelve_shift=\(f_twelve_shift)"
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
            dataString = dataString + "&pre1_duration=\(f_pre1_duration!)"
            dataString = dataString + "&pre1_reason=\(f_pre1_reason!)"
            dataString = dataString + "&pre1_supervisor=\(f_pre1_supervisor!)"
            dataString = dataString + "&emergency_name=\(f_emergency_name!)"
            dataString = dataString + "&emergency_number=\(f_emergency_phone!)"
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
        else if segue.identifier == "segue_to_mainedit_from_work"{
            let vc = segue.destination as! MainEditViewController
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
        var days_availarr = [String]()
        if(f_days_avail != ""){
            days_availarr = f_days_avail.components(separatedBy: ",")
        }
        
        if(sender.tag == 0){
            if(days_availarr.count == 7){
                if(btn_monday.isSelected==true){
                    btn_monday.isSelected = true
                }
                if(btn_tuesday.isSelected==true){
                    btn_tuesday.isSelected = false
                }
                if(btn_wednesday.isSelected==true){
                    btn_wednesday.isSelected = false
                }
                if(btn_thursday.isSelected==true){
                    btn_thursday.isSelected = false
                }
                if(btn_friday.isSelected==true){
                    btn_friday.isSelected = false
                }
                if(btn_saturday.isSelected==true){
                    btn_saturday.isSelected = false
                }
                if(btn_sunday.isSelected==true){
                    btn_sunday.isSelected = false
                }
                days_availarr = [];
            }else{
                if(btn_monday.isSelected==false){
                    btn_monday.isSelected = true
                }
                if(btn_tuesday.isSelected==false){
                    btn_tuesday.isSelected = true
                }
                if(btn_wednesday.isSelected==false){
                    btn_wednesday.isSelected = true
                }
                if(btn_thursday.isSelected==false){
                    btn_thursday.isSelected = true
                }
                if(btn_friday.isSelected==false){
                    btn_friday.isSelected = true
                }
                if(btn_saturday.isSelected==false){
                    btn_saturday.isSelected = true
                }
                if(btn_sunday.isSelected==false){
                    btn_sunday.isSelected = true
                }
                days_availarr = ["SUN","MON","TUES","WED","THURS","FRI","SAT"]
            }
        }
        else if(sender.tag == 1){
            if(days_availarr.count > 0){
                let index = days_availarr.index(of: "MON")
                if(index != nil){
                    days_availarr.remove(at: index!)
                    if(btn_all_days.isSelected==true){
                        btn_all_days.isSelected=false
                    }
                }else{
                    days_availarr.append("MON")
                    if(days_availarr.count == 7){
                        if(btn_all_days.isSelected==false){
                            btn_all_days.isSelected=true
                        }
                    }
                }
            }else{
                days_availarr.append("MON")
            }
        }
        else if(sender.tag == 2){
            if(days_availarr.count > 0){
                let index = days_availarr.index(of: "TUES")
                if(index != nil){
                    days_availarr.remove(at: index!)
                    if(btn_all_days.isSelected==true){
                        btn_all_days.isSelected=false
                    }
                }else{
                    days_availarr.append("TUES")
                    if(days_availarr.count == 7){
                        if(btn_all_days.isSelected==false){
                            btn_all_days.isSelected=true
                        }
                    }
                }
            }else{
                days_availarr.append("TUES")
            }
        }
        else if(sender.tag == 3){
            if(days_availarr.count > 0){
                let index = days_availarr.index(of: "WED")
                if(index != nil){
                    days_availarr.remove(at: index!)
                    if(btn_all_days.isSelected==true){
                        btn_all_days.isSelected=false
                    }
                }else{
                    days_availarr.append("WED")
                    if(days_availarr.count == 7){
                        if(btn_all_days.isSelected==false){
                            btn_all_days.isSelected=true
                        }
                    }
                }
            }else{
                days_availarr.append("WED")
            }
        }
        else if(sender.tag == 4){
            if(days_availarr.count > 0){
                let index = days_availarr.index(of: "THURS")
                if(index != nil){
                    days_availarr.remove(at: index!)
                    if(btn_all_days.isSelected==true){
                        btn_all_days.isSelected=false
                    }
                }else{
                    days_availarr.append("THURS")
                    if(days_availarr.count == 7){
                        if(btn_all_days.isSelected==false){
                            btn_all_days.isSelected=true
                        }
                    }
                }
            }else{
                days_availarr.append("THURS")
            }
        }
        else if(sender.tag == 5){
            if(days_availarr.count > 0){
                let index = days_availarr.index(of: "FRI")
                if(index != nil){
                    days_availarr.remove(at: index!)
                    if(btn_all_days.isSelected==true){
                        btn_all_days.isSelected=false
                    }
                }else{
                    days_availarr.append("FRI")
                    if(days_availarr.count == 7){
                        if(btn_all_days.isSelected==false){
                            btn_all_days.isSelected=true
                        }
                    }
                }
            }else{
                days_availarr.append("FRI")
            }
        }
        else if(sender.tag == 6){
            if(days_availarr.count > 0){
                let index = days_availarr.index(of: "SAT")
                if(index != nil){
                    days_availarr.remove(at: index!)
                    if(btn_all_days.isSelected==true){
                        btn_all_days.isSelected=false
                    }
                }else{
                    days_availarr.append("SAT")
                    if(days_availarr.count == 7){
                        if(btn_all_days.isSelected==false){
                            btn_all_days.isSelected=true
                        }
                    }
                }
            }else{
                days_availarr.append("SAT")
            }
        }
        else if(sender.tag == 7){
            if(days_availarr.count > 0){
                let index = days_availarr.index(of: "SUN")
                if(index != nil){
                    days_availarr.remove(at: index!)
                    if(btn_all_days.isSelected==true){
                        btn_all_days.isSelected=false
                    }
                }else{
                    days_availarr.append("SUN")
                    if(days_availarr.count == 7){
                        if(btn_all_days.isSelected==false){
                            btn_all_days.isSelected=true
                        }
                    }
                }
            }else{
                days_availarr.append("SUN")
            }
        }
        
        f_days_avail = days_availarr.joined(separator: ",")
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
    }    
  
    // MARK: - Get KM range function
    @IBAction func get_km_range(_ sender: DLRadioButton) {
        if(sender.tag == 1){
            f_kmrange = "30"
        }else if(sender.tag == 2){
            f_kmrange = "40"
        }else if(sender.tag == 3){
            f_kmrange = "50"
        }else if(sender.tag == 4){
            f_kmrange = "60"
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
    
    @IBAction func agencynumberformat(_ sender: Any) {
        let num = testFormat(sourcePhoneNumber: txt_previous_telephone.text!)
        if(num != "nil"){
            txt_previous_telephone.text=num
        }else{
            glob_flag = false
            glob_error = "Invalid Agency Phone Number"
            txt_previous_telephone.text=""
            
            let alert = UIAlertController(title: "Please Try Again", message: glob_error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    @IBAction func emenumberformat(_ sender: Any) {
        let num = testFormat(sourcePhoneNumber: txt_emergency_number.text!)
        if(num != "nil"){
            txt_emergency_number.text=num
        }else{
            glob_flag = false
            glob_error = "Invalid Emergency Phone Number"
            txt_emergency_number.text=""
            
            let alert = UIAlertController(title: "Please Try Again", message: glob_error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    
}
