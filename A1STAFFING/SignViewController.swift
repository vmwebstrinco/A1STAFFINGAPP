
//
//  SignViewController.swift
//  A1STAFFING
// Created by Kalakcika Dinesh on 2017-11-24.
//  Copyright © 2018 VMEWBS ENTERPRISE LTD. All rights reserved.
//

import UIKit

open class SignViewController: UIViewController {
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
        let social_insurance: String
        let own_car: String
        let work_permit_number: String
        let valid_till: String
        let legal_right: String
        let hear_from: String
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
        let pre1_from: String
        let pre1_to: String
        let pre1_reason: String
        let pre1_supervisor: String
        let emergency_notify: String
        let criminal_pardon: String
        let other_form: String
        let temp_service: String
        let name_of_agency: String
        let jobs_sent: String
        
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
            case social_insurance
            case own_car
            case work_permit_number
            case valid_till
            case legal_right
            case hear_from            
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
            case pre1_from
            case pre1_to
            case pre1_reason
            case pre1_supervisor
            case emergency_notify
            case criminal_pardon
            case other_form
            case temp_service
            case name_of_agency
            case jobs_sent
        }
    }
    
    // MARK: - UI Items declaration
    @IBOutlet weak var details_view: UIView!
    
    @IBOutlet weak var lbl_name: UILabel!
    @IBOutlet weak var lbl_gender: UILabel!
    @IBOutlet weak var lbl_dob: UILabel!
    @IBOutlet weak var lbl_mobile: UILabel!
    @IBOutlet weak var lbl_email: UILabel!
    @IBOutlet weak var lbl_address: UILabel!
    @IBOutlet weak var lbl_sin: UILabel!
    @IBOutlet weak var lbl_own_car : UILabel!
    @IBOutlet weak var lbl_work_permit_number : UILabel!
    @IBOutlet weak var lbl_legal_right : UILabel!
    @IBOutlet weak var lbl_hear_from : UILabel!
    
    @IBOutlet weak var lbl_category: UILabel!
    @IBOutlet weak var lbl_kmrange: UILabel!
    @IBOutlet weak var lbl_shifts: UILabel!
    @IBOutlet weak var lbl_weekends: UILabel!
    @IBOutlet weak var lbl_overtime: UILabel!
    @IBOutlet weak var lbl_twelve_shift: UILabel!
    @IBOutlet weak var lbl_steel_toed: UILabel!
    @IBOutlet weak var lbl_english: UILabel!
    @IBOutlet weak var lbl_areas_exp: UILabel!
    @IBOutlet weak var lbl_days_availe: UILabel!
    @IBOutlet weak var lbl_cer: UILabel!
    @IBOutlet weak var lbl_other_cer: UILabel!
    
    @IBOutlet weak var lbl_pre1_name: UILabel!
    @IBOutlet weak var lbl_pre1_tel: UILabel!
    @IBOutlet weak var lbl_pre1_address: UILabel!
    @IBOutlet weak var lbl_pre1_position: UILabel!
    @IBOutlet weak var lbl_pre1_salary: UILabel!
    @IBOutlet weak var lbl_pre1_from: UILabel!
    @IBOutlet weak var lbl_pre1_to: UILabel!
    @IBOutlet weak var lbl_pre1_reason: UILabel!
    @IBOutlet weak var lbl_pre1_supervisor: UILabel!
    @IBOutlet weak var lbl_emergency_notify: UILabel!
    @IBOutlet weak var lbl_criminal_pardon: UILabel!
    @IBOutlet weak var lbl_other_form: UILabel!
    @IBOutlet weak var lbl_temp_service: UILabel!
    @IBOutlet weak var lbl_name_of_agency: UILabel!
    @IBOutlet weak var lbl_jobs_sent: UILabel!
    
    // MARK: - Variable declarations
    var insertid : Int = 162
    
    // MARK: - Life cycle methods
    override open func viewDidLoad() {
        
        details_view.layer.borderWidth = 0.5
        details_view.layer.borderColor = UIColor.black.cgColor
        
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
                    
                    let mobile : String = emp.mobile
                    var phone : String = emp.main_phone
                    if(mobile != ""){
                        phone += " / " + mobile
                    }
                    
                    var work_permit_number : String = emp.work_permit_number
                    let valid_till : String = emp.valid_till
                    if(valid_till != ""){
                        work_permit_number += " / " + valid_till
                    }                    
                    
                    var shifts : String = ""
                    let days : String = emp.days
                    if(days == "YES"){
                        if(shifts != ""){
                            shifts += ", "
                        }
                        shifts += "Days"
                    }
                    let afternoon : String = emp.afternoon
                    if(afternoon == "YES"){
                        if(shifts != ""){
                            shifts += ", "
                        }
                        shifts += "Afternoon"
                    }
                    let nights : String = emp.nights
                    if(nights == "YES"){
                        if(shifts != ""){
                            shifts += ", "
                        }
                        shifts += "Nights"
                    }
                    
                    var english : String = ""
                    let english_speak : String = emp.english_speak
                    if(english_speak == "YES"){
                        if(english != ""){
                            english += ", "
                        }
                        english += "Speak"
                    }
                    let english_read : String = emp.english_read
                    if(english_read == "YES"){
                        if(english != ""){
                            english += ", "
                        }
                        english += "Read"
                    }
                    let english_write : String = emp.english_write
                    if(english_write == "YES"){
                        if(english != ""){
                            english += ", "
                        }
                        english += "Write"
                    }
                    let english_understand : String = emp.english_understand
                    if(english_understand == "YES"){
                        if(english != ""){
                            english += ", "
                        }
                        english += "Understand"
                    }
                    
                    var cer : String = ""
                    let whmis_cer : String = emp.whmis_cer
                    if(whmis_cer == "YES"){
                        if(cer != ""){
                            cer += ", "
                        }
                        cer += "Speak"
                    }
                    let hs_cer : String = emp.hs_cer
                    if(hs_cer == "YES"){
                        if(cer != ""){
                            cer += ", "
                        }
                        cer += "Read"
                    }
                    let st_cer : String = emp.st_cer
                    if(st_cer == "YES"){
                        if(cer != ""){
                            cer += ", "
                        }
                        cer += "Write"
                    }
                    
                    self.lbl_name.text = emp.title+" "+emp.first_name+" "+emp.middle_name+" "+emp.last_name
                    self.lbl_gender.text = emp.gender
                    self.lbl_dob.text = emp.dob
                    self.lbl_mobile.text = phone
                    self.lbl_email.text = emp.main_email
                    self.lbl_address.text = emp.address
                    self.lbl_sin.text = emp.social_insurance
                    self.lbl_category.text = emp.category
                    self.lbl_kmrange.text = emp.kmrange
                    
                    self.lbl_own_car.text = emp.own_car
                    self.lbl_legal_right.text = emp.legal_right
                    self.lbl_hear_from.text = emp.hear_from
                    self.lbl_work_permit_number.text = work_permit_number
                    
                    self.lbl_shifts.text = shifts
                    self.lbl_weekends.text = emp.weekends
                    self.lbl_overtime.text = emp.overtime
                    self.lbl_twelve_shift.text = emp.twelve_shift
                    self.lbl_steel_toed.text = emp.steel_toed
                    self.lbl_english.text = english
                    self.lbl_areas_exp.text = emp.areas_exp
                    self.lbl_days_availe.text = emp.days_avail
                    self.lbl_cer.text = cer
                    self.lbl_other_cer.text = emp.other_cer
                    
                    self.lbl_pre1_name.text = emp.pre1_name
                    self.lbl_pre1_tel.text = emp.pre1_tel
                    self.lbl_pre1_address.text = emp.pre1_address
                    self.lbl_pre1_position.text = emp.pre1_position
                    self.lbl_pre1_salary.text = emp.pre1_salary
                    self.lbl_pre1_from.text = emp.pre1_from
                    self.lbl_pre1_to.text = emp.pre1_to
                    self.lbl_pre1_reason.text = emp.pre1_reason
                    self.lbl_pre1_supervisor.text = emp.pre1_supervisor
                    self.lbl_emergency_notify.text = emp.emergency_notify
                    
                    self.lbl_criminal_pardon.text = emp.criminal_pardon
                    self.lbl_other_form.text = emp.other_form
                    self.lbl_temp_service.text = emp.temp_service
                    self.lbl_name_of_agency.text = emp.name_of_agency
                    self.lbl_jobs_sent.text = emp.jobs_sent
                } catch let err {
                    print("Err", err)
                }
                group.leave()
            }
        })
        insertEntry.resume()
        group.wait()
        super.viewDidLoad()
    }
    
    // MARK: - go back to edit function
    @IBAction func showworkedit(_ sender: Any) {       
        self.performSegue(withIdentifier: "segue_to_work_from_sign", sender: self)
        
    }
    
    // MARK: - go to signature function
    @IBAction func showsignature(_ sender: Any) {
        self.performSegue(withIdentifier: "segue_to_signature_from_sign", sender: self)
        
    }
    
    //MARK: - perform segue
    override open func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_to_work_from_sign"{
            let vc = segue.destination as! WorkViewController               
            vc.insertid = insertid
        }else if segue.identifier == "segue_to_signature_from_sign"{
            let vc = segue.destination as! SignatureViewController
            vc.insertid = insertid
        }
    }
}
