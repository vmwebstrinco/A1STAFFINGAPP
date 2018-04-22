//
//  WorkViewController.swift
//  A1STAFFING
//
//  Created by Kalakcika Dinesh on 4/21/18.
//  Copyright © 2018 VMEWBS ENTERPRISE LTD. All rights reserved.
//

import UIKit

class WorkViewController: UIViewController {
    var insertid : Int = 162
    
    
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
    
   
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

   

}
