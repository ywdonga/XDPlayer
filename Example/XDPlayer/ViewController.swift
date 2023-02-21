//
//  ViewController.swift
//  XDPlayer
//
//  Created by 329720990@qq.com on 01/18/2023.
//  Copyright (c) 2023 329720990@qq.com. All rights reserved.
//

import UIKit
import XDPlayer
import AVKit

let videoUrl = URL(string: "http://vfx.mtime.cn/Video/2019/03/19/mp4/190319212559089721.mp4")!

class ViewController: UIViewController {

    fileprivate var player = XDPlayer()
    
    // MARK: object lifecycle
    deinit {
        self.player.willMove(toParent: nil)
        self.player.view.removeFromSuperview()
        self.player.removeFromParent()
    }

    // MARK: view lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        self.player.playerDelegate = self
        self.player.playbackDelegate = self
        
        self.player.playerView.playerBackgroundColor = .black
        
        self.addChild(self.player)
        self.view.addSubview(self.player.view)
        self.player.didMove(toParent: self)
        
//        let localUrl = Bundle.main.url(forResource: "IMG_3267", withExtension: "MOV")
//        self.player.url = localUrl
        self.player.url = videoUrl
        
        self.player.playbackLoops = true
        
        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGestureRecognizer(_:)))
        tapGestureRecognizer.numberOfTapsRequired = 1
        self.player.view.addGestureRecognizer(tapGestureRecognizer)
        
        let btn = UIButton(frame: CGRect(x: 10, y: 10, width: 100, height: 60))
        btn.setTitle("全屏播放", for: .normal)
        btn.backgroundColor = .red
        btn.addTarget(self, action: #selector(fullBtnClick), for: .touchUpInside)
        view.addSubview(btn)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.player.playFromCurrentTime()
    }
    
    @objc func fullBtnClick() {

    }
}

// MARK: - UIGestureRecognizer

extension ViewController {
    
    @objc func handleTapGestureRecognizer(_ gestureRecognizer: UITapGestureRecognizer) {
        switch self.player.playbackState {
        case .stopped:
            self.player.playFromBeginning()
            break
        case .paused:
            self.player.playFromCurrentTime()
            break
        case .playing:
            self.player.pause()
            break
        case .failed:
            self.player.pause()
            break
        }
    }
    
}

// MARK: - PlayerDelegate

extension ViewController: XDPlayerDelegate {
    
    func playerReady(_ player: XDPlayer) {
        print("\(#function) ready")
    }
    
    func playerPlaybackStateDidChange(_ player: XDPlayer) {
        print("\(#function) \(player.playbackState.description)")
    }
    
    func playerBufferingStateDidChange(_ player: XDPlayer) {
    }
    
    func playerBufferTimeDidChange(_ bufferTime: Double) {
    }
    
    func player(_ player: XDPlayer, didFailWithError error: Error?) {
        print("\(#function) error.description")
    }
    
}

// MARK: - PlayerPlaybackDelegate

extension ViewController: XDPlayerPlaybackDelegate {
    
    func playerCurrentTimeDidChange(_ player: XDPlayer) {
        
    }
    
    func playerPlaybackWillStartFromBeginning(_ player: XDPlayer) {
        
    }
    
    func playerPlaybackDidEnd(_ player: XDPlayer) {
        
    }
    
    func playerPlaybackWillLoop(_ player: XDPlayer) {
        
    }

    func playerPlaybackDidLoop(_ player: XDPlayer) {
        
    }
    
    func playerEnterFullScreen() {
        
    }
    
    func playerExitFullScreen() {
        
    }
}


