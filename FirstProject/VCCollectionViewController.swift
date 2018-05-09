//
//  VCCollectionViewController.swift
//  FirstProject
//
//  Created by IGNACIO GALAN DE PINA on 5/4/18.
//  Copyright © 2018 IGNACIO GALAN DE PINA. All rights reserved.
//

import UIKit

class VCCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource , DataHolderDelegate{
   
    @IBOutlet var colPrincipal:UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataHolder.sharedInstance.descargarPerfiles(delegate:self)
      }
        // Do any additional setup after loading the view.
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func DHDDescargaPerfilesCompleta(blFin: Bool) {
        if blFin {
            self.refreshUI()
        }
    }

  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("CONSULTO CANTIDAD DDE FILAS A PINTAR")
        return DataHolder.sharedInstance.arUsuarios.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "IDmiCelda1", for: indexPath) as! MiCelda2
        celda.lblNombre?.text = DataHolder.sharedInstance.arUsuarios[indexPath.row].sNombre
        if((DataHolder.sharedInstance.arUsuarios[indexPath.row].sImage) != nil){
            celda.mostrarImagen(uri:  DataHolder.sharedInstance.arUsuarios[indexPath.row].sImage!)
        }   else{
            celda.mostrarImagen(uri: "gs://primerproyecto-79dc7.appspot.com/perros/champion_icon.jpg")
        }
        
        return celda
    }
    func refreshUI() {
        DispatchQueue.main.async(execute: {
            self.colPrincipal?.reloadData()
        })
    }
    
 
   
    
}

