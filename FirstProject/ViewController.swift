//
//  ViewController.swift
//  FirstProject
//
//  Created by IGNACIO GALAN DE PINA on 22/3/18.
//  Copyright © 2018 IGNACIO GALAN DE PINA. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController, DataHolderDelegate {
    
    
    @IBOutlet var txtUser:UITextField?
    @IBOutlet var txtPassword:UITextField?
    @IBOutlet var btn:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        
        /*
         do{
         try Auth.auth().signOut()
         } catch{
         
         }
         */
        
        //        Auth.auth().addStateDidChangeListener { (auth, user) in
        //           if user != nil{
        //                self.performSegue(withIdentifier: "transitionLogin", sender: self)
        //            }
        //        }
        txtUser?.text = DataHolder.sharedInstance.sNickname
        DataHolder.sharedInstance.sNickname = "123456"
        txtPassword?.text = DataHolder.sharedInstance.sNickname
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func DHDConfirmacionLogin(blFin:Bool) {
        if blFin {
            self.performSegue(withIdentifier: "transitionLogin", sender: self)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickLoginEvent(){
        print("Hola " + (txtUser?.text)!)
        DataHolder.sharedInstance.confirmarLogin(user: (txtUser?.text)!, password: (txtPassword?.text)!, delegate: self)
        
        
    }
    
    
    
}
