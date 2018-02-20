
//
//  ThirdViewController.swift
//  A1STAFFING
// Created by Dinesh Kunanayagam on 2017-11-24.
//  Copyright © 2018 VMEWBS ENTERPRISE LTD. All rights reserved.
//

import UIKit

// MARK: - EPSignatureDelegate
@objc public protocol EPSignatureDelegate {
    @objc optional    func epSignature(_: SignViewController, didCancel error : NSError)
    @objc optional    func epSignature(_: SignViewController, didSign signatureImage : UIImage, boundingRect: CGRect)
}

open class SignViewController: UIViewController {
    // MARK: - UI Items declaration
    @IBOutlet weak var bor_label: UILabel!
    @IBOutlet weak var signatureView: EPSignatureView!
    @IBOutlet weak var lbl: UILabel!
    
    
    // MARK: - Variable declarations
    var insertid : Int = 0
    
    var f_title : String = ""
    var f_first_name : String = ""
    var f_middle_name : String = "'"
    var f_last_name : String = ""
    var f_gender : String = ""
    var f_dob : String = ""
    var f_main_phone : String = ""
    var f_mobile : String = ""
    var f_main_email : String = ""
    var f_address : String = ""
    var f_social_insurance : String = ""
    var f_category : String = ""
    var f_kmrange: String?
    var sig : String="";
    
    open var showsSaveSignatureOption: Bool = true
    open weak var signatureDelegate: EPSignatureDelegate?
    open var tintColor = UIColor.defaultTintColor()
    
    
    // MARK: - Life cycle methods
    override open func viewDidLoad() {
        super.viewDidLoad()
        lbl.text = String(insertid)
        
        bor_label.layer.borderWidth = 0.5
        bor_label.layer.borderColor = UIColor.black.cgColor
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
        let bundle = Bundle(for: SignViewController.self)
        super.init(nibName: "SignViewController", bundle: bundle)
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
    
    // MARK: - Updte signature
    
    @IBAction func updatesignature(_ sender: Any) {
        
    }
    
    // MARK: - SUbmit form function
    @IBAction func submitForm(_ sender: Any) {
        if let signature = signatureView.getSignatureAsImage(){
            sig = signatureView.converAsBase64()!
            signatureDelegate?.epSignature!(self, didSign: signature, boundingRect: signatureView.getSignatureBoundsInCanvas())
        }
        
        let inserviceUrl = "http://a1staffing.ca/insert.php"
        let inurl = URL(string: inserviceUrl)
        
        var request = URLRequest(url: inurl!)
        request.httpMethod = "POST"
        var dataString = "secretWord=44fdcv8jf3"
        
        dataString = dataString + "&title=\(f_title)"
        dataString = dataString + "&first_name=\(f_first_name)"
        dataString = dataString + "&middle_name=\(f_middle_name)"
        dataString = dataString + "&last_name=\(f_last_name)"
        dataString = dataString + "&gender=\(f_gender)"
        dataString = dataString + "&dob=\(f_dob)"
        dataString = dataString + "&main_phone=\(f_main_phone)"
        dataString = dataString + "&mobile=\(f_mobile)"
        dataString = dataString + "&main_email=\(f_main_email)"
        dataString = dataString + "&address=\(f_address)"
        dataString = dataString + "&social_insurance=\(f_social_insurance)"
        dataString = dataString + "&category=\(f_category)"
        dataString = dataString + "&kmrange=\(f_kmrange!)"
        dataString = dataString + "&stringnature=\(sig)"
        
        let dataD = dataString.data(using: .utf8)
        
        let insertEntry = URLSession.shared.uploadTask(with:request, from: dataD, completionHandler: { (data, response, error) in
            
            if error != nil {
                DispatchQueue.main.async
                    {
                        let alert = UIAlertController(title: "Please Try Again", message: "Looks like the connection to the server didn't work. Do you have Internet access?", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                }
            }
            else
            {
                if let unwrappedData = data {
                    
                    let returnedData = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                    
                    if returnedData == "1"
                    {
                        DispatchQueue.main.async
                            {
                                let alert = UIAlertController(title: "Success", message: "Successfully registered", preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                                self.present(alert, animated: true, completion: nil)
                        }
                    }
                    else
                    {
                        DispatchQueue.main.async
                            {
                                let alert = UIAlertController(title: "Error", message: "Please try again later", preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                                self.present(alert, animated: true, completion: nil)
                        }
                    }
                }
            }
        })
        insertEntry.resume()
        performSegue(withIdentifier: "sequetoone", sender: self)
    }
    
    
    
}
