//
//  NibView.swift
//  xib-test
//
//  Created by Simon Deutsch on 06.09.22.
//

import UIKit

@IBDesignable
class NibView: UIView {
    
    private static var nibCache = [String: UINib]()
    
    @IBOutlet weak var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        self.contentView = type(of: self).fromNib(named: String(describing: type(of: self)), owner: self)
        self.contentView.frame = self.bounds
        self.contentView.backgroundColor = UIColor.clear
        self.contentView.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth,
                                      UIView.AutoresizingMask.flexibleHeight]
        self.addSubview(self.contentView)
    }
    
    private static var bundle: Bundle = {
        // need to resolve this dynamically to also support interface builder designable
        Bundle(for: NibView.self)
    }()
        
    // Courtesy of https://stackoverflow.com/questions/24857986/load-a-uiview-from-nib-in-swift
    class func fromNib<T: UIView>() -> T {
        let key = String(describing: T.self)
        var nib = nibCache[key]
        if nib == nil {
            nib = UINib(nibName: key, bundle: bundle)
            nibCache[key] = nib
        }
        return nib?.instantiate(withOwner: nil, options: nil)[0] as! T
    }
    
    class func fromNib<T: UIView>(named name: String, owner: UIView) -> T {
        var nib = nibCache[name]
        if nib == nil {
            nib = UINib(nibName: name, bundle: bundle)
            nibCache[name] = nib
        }
        return nib?.instantiate(withOwner: owner, options: nil)[0] as! T
    }
}
