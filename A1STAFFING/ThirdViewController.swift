//
//  ThirdViewController.swift
//  A1STAFFING
// Created by Dinesh Kunanayagam on 2017-11-24.
//  Copyright © 2018 VMEWBS ENTERPRISE LTD. All rights reserved.
//

import UIKit

// MARK: - EPSignatureDelegate
@objc public protocol EPSignatureDelegate {
    @objc optional    func epSignature(_: ThirdViewController, didCancel error : NSError)
    @objc optional    func epSignature(_: ThirdViewController, didSign signatureImage : UIImage, boundingRect: CGRect)
}

open class ThirdViewController: UIViewController {
    // MARK: - UI Items declaration
    @IBOutlet weak var lbl_error_three: UILabel!
    @IBOutlet weak var work_type_full: DLRadioButton!
    @IBOutlet weak var work_type_part: DLRadioButton!
    @IBOutlet weak var txt_km_range: UITextField!    
    @IBOutlet weak var bor_label: UILabel!
    @IBOutlet weak var signatureView: EPSignatureView!
    
    // MARK: - Variable declarations
    var f_category : String = ""
    var f_kmrange: String?
    var sig : String="";
    
    open var showsSaveSignatureOption: Bool = true
    open weak var signatureDelegate: EPSignatureDelegate?
    open var tintColor = UIColor.defaultTintColor()
    
    
    // MARK: - Life cycle methods
    override open func viewDidLoad() {
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
        
        txt_km_range.setLeftPaddingPoints(10)
        txt_km_range.setRightPaddingPoints(10)
        
        bor_label.layer.borderWidth = 0.5
        bor_label.layer.borderColor = UIColor.black.cgColor
    }
    
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Initializers
    public convenience init(signatureDelegate: EPSignatureDelegate) {
        self.init(signatureDelegate: signatureDelegate, showsDate: true, showsSaveSignatureOption: true)
    }
    
    public convenience init(signatureDelegate: EPSignatureDelegate, showsDate: Bool) {
        self.init(signatureDelegate: signatureDelegate, showsDate: showsDate, showsSaveSignatureOption: true)
    }
    
    public init(signatureDelegate: EPSignatureDelegate, showsDate: Bool, showsSaveSignatureOption: Bool ) {
        self.showsSaveSignatureOption = showsSaveSignatureOption
        self.signatureDelegate = signatureDelegate
        let bundle = Bundle(for: ThirdViewController.self)
        super.init(nibName: "ThirdViewController", bundle: bundle)
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    // MARK: - Clear Button Action
    @IBAction func btn_clear(_ sender: Any) {
        signatureView.clear()
    }
    
    override open func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        signatureView.reposition()
    }
    
   
    // MARK: - Form validate function
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
    
    
    // MARK: - SUbmit form function
    @IBAction func submitForm(_ sender: Any) {
        if(validateform() == 0){
            //lbl_error_three.text="Please fill all required fields"
            let alert = UIAlertController(title: "Alert", message: "Please fill all required fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if(validateform() == 1){
            lbl_error_three.text=""; let alert = UIAlertController(title: "Success", message: "Successfully registered", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
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
