//
//  VCRegister.swift
//  FirstProject
//
//  Created by IGNACIO GALAN DE PINA on 3/4/18.
//  Copyright © 2018 IGNACIO GALAN DE PINA. All rights reserved.
//

import UIKit
import FirebaseAuth

class VCRegister: UIViewController, DataHolderDelegate {
    
    @IBOutlet var txtEmail:UITextField?
    @IBOutlet var txtUser:UITextField?
    @IBOutlet var txtPassword:UITextField?
    @IBOutlet var txtRePassword:UITextField?
    @IBOutlet var btnAceptar:UIButton?
    @IBOutlet var btnCancelar:UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func DHDCrearUsuarioRegistro(blFin:Bool) {
        if blFin {
            self.performSegue(withIdentifier: "transitionRegister", sender: self)
        }
    }
    @IBAction func clickRegistrar(){
        DataHolder.sharedInstance.miPerfil.sNombre = txtUser?.text
        DataHolder.sharedInstance.miPerfil.iFecha = 1900
        DataHolder.sharedInstance.miPerfil.sApellido = txtEmail?.text
        
        DataHolder.sharedInstance.crearUsuario(user: (txtEmail?.text)!, password: (txtPassword?.text)!, delegate: self)
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destinationViewController.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}
