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
    @IBOutlet weak var sliderVolumen: UISlider!
    
    @IBOutlet weak var botónDetener: UIButton!
    @IBOutlet weak var botónTocar: UIButton!
    @IBOutlet weak var botónPausar: UIButton!
    
    var reproductor: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = NSBundle.mainBundle().pathForResource("137 horas.mp3", ofType:nil)!
        let url = NSURL(fileURLWithPath: path)
        
        do {
            let sound = try AVAudioPlayer(contentsOfURL: url)
            reproductor = sound
            
            controlVolumen.value = Double(reproductor.volume)
            sliderVolumen.value = reproductor.volume
        } catch {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func canciónAleatoria() {
    }
    
    @IBAction func buscarCanción() {
    }

    @IBAction func deneterReproducción() {
        reproductor.stop()
        reproductor.currentTime = 0
    }

    @IBAction func iniciarCanción() {
        reproductor.play()
        
    }
    
    @IBAction func pausarReproducción() {
        reproductor.pause()
    }
    
    @IBAction func cambioDeVolumen(sender: UIStepper) {
        reproductor.volume = Float(sender.value)
        sliderVolumen.value = reproductor.volume
    }
    
    @IBAction func destacarBotónPulsado(sender: UIButton) {
        let bold = UIFont.boldSystemFontOfSize(15)
        let regular = UIFont.systemFontOfSize(15)
        
        switch sender {
        case botónDetener:
            botónTocar.titleLabel?.font = regular
            botónPausar.titleLabel?.font = regular
            break
        case botónTocar:
            botónTocar.titleLabel?.font = bold
            botónPausar.titleLabel?.font = regular
            break
        case botónPausar:
            botónTocar.titleLabel?.font = regular
            botónPausar.titleLabel?.font = bold
            break
        default:
            break
        }
    }
    
}

