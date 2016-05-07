//
//  ViewController.swift
//  Reproductor de Música
//
//  Created by Arturo Rivas on 7/5/16.
//  Copyright © 2016 Arturo Rivas. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var controlVolumen: UIStepper!
    @IBOutlet weak var portada: UIImageView!
    @IBOutlet weak var título: UILabel!
    
    var reproductor = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(reproductor.volume)
        /*if let volumen = reproductor.volume {
            controlVolumen.value = Double(volumen)
        }*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func canciónAleatoria(sender: UIBarButtonItem) {
    }
    
    @IBAction func buscarCanción(sender: UIBarButtonItem) {
    }

    @IBAction func deneterReproducción() {
    }

    @IBAction func iniciarCanción() {
    }
    
    @IBAction func pausarReproducción() {
    }
    
    @IBAction func cambioDeVolumen(sender: UIStepper) {
        print(sender.value)
        
        /*if let volumen = reproductor.volume {
            volumen = Float(sender.value)
        }*/
    }
}

