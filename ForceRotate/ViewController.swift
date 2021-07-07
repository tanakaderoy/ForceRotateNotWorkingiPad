//
//  ViewController.swift
//  ForceRotate
//
//  Created by Tanaka Mazivanhanga on 7/7/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }

    override var shouldAutorotate: Bool {
        return true
    }

    @IBAction func lockLandscape(_ sender: Any) {
        lockToLandscapeRight()
    }
    @IBAction func unlock(_ sender: Any) {
        unlockOrientation()
    }
    


    @objc
    func lockToLandscapeLeft() {
        setOrientation(.landscapeLeft, mask: .landscapeLeft)
    }

    @objc
    func lockToLandscapeRight() {
        setOrientation(.landscapeRight, mask: .landscapeRight)
    }

    @objc
    func unlockOrientation() {
        setOrientation(.unknown, mask: .all)
    }

    private func setOrientation(_ orientation: UIInterfaceOrientation, mask: UIInterfaceOrientationMask) {
        DispatchQueue.main.async {
            
            UIDevice.current.setValue(UIInterfaceOrientation.unknown.rawValue, forKey: "orientation")
            // This is a private API. `orientation` is a read-only value.
            // See https://developer.apple.com/documentation/uikit/uidevice/1620053-orientation
            // However this seems to be the industry accepted solution to forcing orientations
            // so we are going to keep it. The alternative is to display something telling the user
            // to actually rotate their device, and then disabling auto-rotate once they do so.
            UIDevice.current.setValue(orientation.rawValue, forKey: "orientation")
            UIViewController.attemptRotationToDeviceOrientation()
        }
    }
    
}

