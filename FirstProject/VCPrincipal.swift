//
//  VCPrincipal.swift
//  FirstProject
//
//  Created by IGNACIO GALAN DE PINA on 4/4/18.
//  Copyright © 2018 IGNACIO GALAN DE PINA. All rights reserved.
//

import UIKit

class VCPrincipal: UIViewController, UITableViewDelegate, UITableViewDataSource, DataHolderDelegate {
  
    
    @IBOutlet var tbTablaChamp:UITableView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataHolder.sharedInstance.descargarPerfiles(delegate:self)
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("CONSULTO CANTIDAD DDE FILAS A PINTAR")
        return DataHolder.sharedInstance.arUsuarios.count
    }
    
    func DHDDescargaPerfilesCompleta(blFin: Bool) {
        if blFin {
            self.refreshUI()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = tableView.dequeueReusableCell(withIdentifier: "IDmiCelda") as! MiCelda1
        celda.lblTabla?.text =  DataHolder.sharedInstance.arUsuarios[indexPath.row].sNombre
        celda.lblEmail?.text =  DataHolder.sharedInstance.arUsuarios[indexPath.row].sApellido
        if((DataHolder.sharedInstance.arUsuarios[indexPath.row].sImage) != nil){
            celda.mostrarImagen(uri:  DataHolder.sharedInstance.arUsuarios[indexPath.row].sImage!)
        }   else{
            celda.mostrarImagen(uri: "gs://primerproyecto-79dc7.appspot.com/perros/champion_icon.jpg")
        }
        
        return celda
    }
    
    func refreshUI() {
        DispatchQueue.main.async(execute: {
            self.tbTablaChamp?.reloadData()
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
