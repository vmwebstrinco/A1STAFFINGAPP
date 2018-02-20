
//
//  SignViewController.swift
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
    //Mark: - struct
    struct gemp: Codable {
        let first_name: String?
        
        private enum CodingKeys: String, CodingKey{
            case first_name
            
        }
        
    }
    
    // MARK: - UI Items declaration
    @IBOutlet weak var bor_label: UILabel!
    @IBOutlet weak var details_view: UIView!
    @IBOutlet weak var signatureView: EPSignatureView!
    
    @IBOutlet weak var lbl_name: UILabel!
    @IBOutlet weak var lbl_gender: UILabel!
    @IBOutlet weak var lbl_dob: UILabel!
    @IBOutlet weak var lbl_mobile: UILabel!
    @IBOutlet weak var lbl_email: UILabel!
    @IBOutlet weak var lbl_address: UILabel!
    @IBOutlet weak var lbl_sin: UILabel!
    @IBOutlet weak var lbl_category: UILabel!
    @IBOutlet weak var lbl_kmrange: UILabel!
    
    // MARK: - Variable declarations
    var insertid : Int = 162
    var sig : String="";
    
    open var showsSaveSignatureOption: Bool = true
    open weak var signatureDelegate: EPSignatureDelegate?
    open var tintColor = UIColor.defaultTintColor()
    
    
    // MARK: - Life cycle methods
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        bor_label.layer.borderWidth = 0.5
        bor_label.layer.borderColor = UIColor.black.cgColor
        
        details_view.layer.borderWidth = 0.5
        details_view.layer.borderColor = UIColor.black.cgColor       
        
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
    
    // MARK: - Updte signature button
    @IBAction func updatesignature(_ sender: Any) {
        self.performSegue(withIdentifier: "sequetomain", sender: self)
    }
    
    override open func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sequetomain"{
            
            if let signature = signatureView.getSignatureAsImage(){
                sig = signatureView.converAsBase64()!
                signatureDelegate?.epSignature!(self, didSign: signature, boundingRect: signatureView.getSignatureBoundsInCanvas())
            }
            
            let inserviceUrl = "http://a1staffing.ca/app/services.php"
            let inurl = URL(string: inserviceUrl)
            
            var request = URLRequest(url: inurl!)
            request.httpMethod = "POST"
            var dataString = "secretWord=12345b"
            dataString = dataString + "&action=updatesign"
            dataString = dataString + "&stringnature=\(sig)"
            dataString = dataString + "&id=\(insertid)"
            
            let dataD = dataString.data(using: .utf8)
            
            let group = DispatchGroup()
            group.enter()
            
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
        }
    }
}

