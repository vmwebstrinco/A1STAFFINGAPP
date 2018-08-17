//
//  SignatureViewController.swift
//  A1STAFFING
//
//  Created by Kalakcika Dinesh on 4/23/18.
//  Copyright © 2018 VMEWBS ENTERPRISE LTD. All rights reserved.
//

import UIKit

// MARK: - EPSignatureDelegate
@objc public protocol EPSignatureDelegate {
    @objc optional    func epSignature(_: SignatureViewController, didCancel error : NSError)
    @objc optional    func epSignature(_: SignatureViewController, didSign signatureImage : UIImage, boundingRect: CGRect)
}

open class SignatureViewController: UIViewController {
    // MARK: - UI Items declaration
    @IBOutlet weak var bor_label: UILabel!
    @IBOutlet weak var signatureView: EPSignatureView!
    
    // MARK: - Variable declarations
    var insertid : Int = 162
    var sig : String="";
    
    open var showsSaveSignatureOption: Bool = true
    open weak var signatureDelegate: EPSignatureDelegate?
    open var tintColor = UIColor.defaultTintColor()
    
    
    // MARK: - Life cycle methods
    override open func viewDidLoad() {
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
        super.init(nibName: "SignnatureViewController", bundle: bundle)
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
                                let alert = UIAlertController(title: "Registered Successfully", message: "Thank you for registering with A1 Staffing Solutions INC. We will conatct you shortly or reach us by 416 638-030 / Email : info@a1staffingsolution.com", preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                                    self.performSegue(withIdentifier: "segue_to_view_from_signature", sender: self)
                                }))
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

