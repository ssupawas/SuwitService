//
//  MyServiceViewController.swift
//  SuwitService
//
//  Created by suwit supawas on 30/5/2562 BE.
//  Copyright © 2562 suwit supawas. All rights reserved.
//

import UIKit
import AVFoundation // เป็น  class libraly ภายนอกเข้ามาใช้งาน

class MyServiceViewController: UIViewController {
    
    var Player: AVPlayer?  // ประกาศตัวแปรที่ใช้ class นี้เท่านั้น global
    
    
    

    @IBOutlet weak var testOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    } // Main Method
    
    
    @IBAction func testButton(_ sender: UIButton) {
        
        testOutlet.frame = CGRect(x: 19, y: 200, width: 200, height: 200)
    }
    
    
    

    @IBAction func stopButton(_ sender: UIButton) {
        
        Player?.pause()
        
    }
    
    
    @IBAction func playButton(_ sender: UIButton) {
        
        let urlMP3: String = "https://febcthailand.com/m/mp3/answer/r.mp3"
        let url = URL.init(string: urlMP3)
        
        
        
        let playerItem: AVPlayerItem = AVPlayerItem(url: url!)
        Player = AVPlayer(playerItem: playerItem)
        let playerLayer: AVPlayerLayer = AVPlayerLayer(player: Player)
        
        playerLayer.frame = CGRect(x: 0, y: 0, width: 10, height: 50)
        self.view.layer.addSublayer(playerLayer)
        Player!.play() // ได้ปุ่มเปิดแล้วครับ
        

        
    } // PlayButton
    

} // Main Class
