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
    @IBOutlet weak var txt_emergency_2: UITextField!
    @IBOutlet weak var txt_any_other_emp: UITextField!
    @IBOutlet weak var txt_agency_name: UITextField!
    @IBOutlet weak var txt_list_jobs: UITextField!
    
   
    
    // MARK: - Work Variable Declarations
    
    var f_category : String = ""
    var f_kmrange: String?
    
    
    
    
    // MARK: - Previous Variable Declarations
    
   
    
    
    //MARKL - View onload function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - View Declaration
        
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
        
        txt_emergency_2.setLeftPaddingPoints(15)
        txt_emergency_2.setRightPaddingPoints(15)
        
        txt_emergency_2.layer.shadowOpacity = 1.0;
        txt_emergency_2.layer.shadowRadius = 0.0;
        txt_emergency_2.layer.shadowColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0).cgColor;
        txt_emergency_2.layer.shadowOffset = CGSize(width: -5.0, height: 0.0);
        
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

    }
    
    
    //MARKL - Validates form
    public func validateform() -> Int{
        f_kmrange = txt_km_range.text
        if(f_kmrange == nil){
            f_kmrange = ""
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

}
