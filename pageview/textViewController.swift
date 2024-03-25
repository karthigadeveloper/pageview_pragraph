//
//  textViewController.swift
//  pageview
//
//  Created by apple on 8/18/23.
//

import UIKit

class textViewController: UIViewController {
    let myText:String
    
    private let myTextview: UITextView = {
        let textview = UITextView()
        textview.isEditable = false
        textview.font = .systemFont(ofSize: 24)
        textview.textColor = .black
        
        return textview
        
    }()
    init(with text: String) {
        self.myText = text
        myTextview.text = self.myText
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(self.myTextview)
        
}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myTextview.frame = view.bounds
    }

}
