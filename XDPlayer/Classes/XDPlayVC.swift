//
//  XDPlayVC.swift
//  XDPlayer
//
//  Created by dyw on 2023/1/29.
//

import UIKit
import AVFoundation
import AVKit

class XDPlayVC: AVPlayerViewController {

    // MARK:- Variables
    fileprivate var _supportedOrientations: UIInterfaceOrientationMask!
    
    open weak var playbackDelegate: XDPlayerPlaybackDelegate?
    
    // MARK:- Initiation
    required convenience init(playbackDelegate: XDPlayerPlaybackDelegate?, supportedOrientations: UIInterfaceOrientationMask) {
        self.init()
        
        self.playbackDelegate = playbackDelegate
        self._supportedOrientations = supportedOrientations
    }
    
    
    // MARK:- Overrides
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.player?.play()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        playbackDelegate?.playerEnterFullScreen()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        playbackDelegate?.playerExitFullScreen()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return _supportedOrientations
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
}
