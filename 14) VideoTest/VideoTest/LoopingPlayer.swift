//
//  LoopingPlayer.swift
//  VideoTest
//
//  Created by profesor on 14/11/22.
//

import SwiftUI
import AVFoundation

struct LoopingPlayer: UIViewRepresentable{
    func makeUIView(context: Context) -> some UIView {
        //return the player:
        return QueuePlayerUIView(frame: .zero)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        // Do nothing
    }
    
}

class QueuePlayerUIView: UIView{
    private var playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        let fileUrl = Bundle.main.url(forResource: "timer", withExtension: "mov")!
        let playerItem = AVPlayerItem(url: fileUrl)
        
        //Setup player:
        
        let player = AVQueuePlayer(playerItem: playerItem)
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
        
        //Loop:
        
        playerLooper = AVPlayerLooper(player: player, templateItem: playerItem)
        
        //Play:
        
        player.play()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) is not implemented ")
    }
}

class PlayerUIView: UIView{
   private var playerLayer = AVPlayerLayer()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        let fileUrl = Bundle.main.url(forResource: "timer", withExtension: "mov")!
        let playerItem = AVPlayerItem(url: fileUrl)
        
        //Setup player:
        
        let player = AVQueuePlayer(playerItem: playerItem)
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
        
        //Loop:
        
        player.actionAtItemEnd = .none
        NotificationCenter.default.addObserver(self, selector: #selector(rewindVideo(notification: )), name: .AVPlayerItemDidPlayToEndTime, object: player.currentItem)
        
        //Play:
        player.play()
    }
    
    @objc
    func rewindVideo(notification: Notification){
        playerLayer.player?.seek(to: .zero)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not implemented ")
    }
}
