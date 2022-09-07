//
//  CallControlViewWrapper.swift
//  xib-test
//
//  Created by Simon Deutsch on 07.09.22.
//

import UIKit

class CallControlViewWrapper: NibView {
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
        containerView.backgroundColor = .systemGreen
    }
    
    @IBAction func click(_ sender: Any) {
        print("middle")
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonInit()
    }
}

