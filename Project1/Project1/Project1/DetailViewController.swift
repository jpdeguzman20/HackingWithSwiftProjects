//
//  DetailViewController.swift
//  Project1
//
//  Created by Jonathan Deguzman on 11/15/16.
//  Copyright © 2016 Jonathan Deguzman. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    // @IBOutlet is used to tell Xcode that there is a connection between this line and Interface Builder
    // 'weak' means that we don't want to own the object in memory because it is placed in view, thus view already owns it
    // UIImageView! means that UIImageView may be there or may  not be, but we're certain it will be by the time we want to use it
    @IBOutlet weak var imageView: UIImageView!
    
    // Since selectedImage is an optional, we're going to have to use 'if let' to check if it has a value and if so, pull it out; otherwise, do nothing.
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedImage
        
        // Check and unwrap the option in selectedImage and assigns it to constant imageToLoad
        if let imageToLoad = selectedImage {
            // UIImage is the data type we'll use to load image data, such as PNG or JPEGs
            
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    // Called when view is about to be shown
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Check to see if there is a navigationController property and if there is, hide the nav bar
        navigationController?.hidesBarsOnTap = true
    }
    
    // Called when view is about to disappear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Check to see if there is a navigationController property and if there is, show the nav bar
        navigationController?.hidesBarsOnTap = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
