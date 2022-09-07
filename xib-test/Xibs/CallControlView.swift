//
//  CallControlView.swift
//  xib-test
//
//  Created by Simon Deutsch on 06.09.22.
//

import UIKit

class CallControlView: NibView {
    @IBOutlet var containerView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        containerView.backgroundColor = .systemPink
    }
    
    @IBAction func leftClick(_ sender: Any) {
        print("left")
    }
    
    @IBAction func rightClick(_ sender: Any) {
        print("right")
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonInit()
    }
}
