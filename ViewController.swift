//
//  ViewController.swift
//  Project1 -- This is my first ever Swift project so I'm going to comment the hell out of it
//
//  Created by Jonathan Deguzman on 11/14/16.
//  Copyright © 2016 Jonathan Deguzman. All rights reserved.
//

// Importing the UIKit means that this file will reference the iOS user interface toolkit
import UIKit

// This means that I want to create a new screen called ViewController that extends UITableViewController
class ViewController: UITableViewController {

    // Here we have a variable called pictures in the LHS
    // In the RHS, we want to make it into a String Array using [String] and then we use () to tell Swift that we want to make it now
    // Thus, this one line of code will create a String array called pictures and will exist from when the ViewController screen is created until when it is destroyed. Note that it behaves this way because pictures is a property of ViewController and exists within the class rather than within a method.
    var pictures = [String]()
    
    // We override the function because we want to change Apple's default behavior from within the UIViewController class
    // viewDidLoad is called when the screen is loaded and is ready for us to optimize
    // All properties for viewDidLoad() are created when viewDidLoad is created and are destroyed when viewDidLoad is finished being called
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        
        // Do any additional setup after loading the view, typically from a nib.
        
        // We have a constant fm that is assigned a value returned by FileManager.default. FileManager is a data type that lets us work with the file system. We'll be using it to help us look for files
        let fm = FileManager.default
        
        // Sets the resource path of the bundle to a constant named path. It basically says "tell me where all the iamges I added to my app can be found
        // Notice the 'Bundle.main.resourcePath!'. It includes an exclamation point at the end because it may or may not return a String, but I'm certain that it will. --- Remember there are 3 ways Swift stores data. 1. The normal way I'm used to 2. Using optionals '?' if it might or might not return a value 3. Using '!' for when it might or might not return a value, but I'm certain that it will.
        let path = Bundle.main.resourcePath!
        
        // The items constant is an array/collection of all the names of the files that are found in the resource directory of our app. Using the path value being passed in, this line is essentially getting the contents of the specific directory, which we have said to be resources
        // The 'try!' keyword means that the following code has a potential to go wrong, but I'm absolutely sure that it won't
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        // I'm going to eventually realize that there are many times where a variable doesn't change and I'll end up using constants (through the keyword 'let') more often.
        
        // Go through the items array which we got from calling contentsOfDirectory()
        for item in items {
            // For each item in the items array, we check to see if it contains nssl using hasPrefix()
            if item.hasPrefix("nssl") {
                // We'll add each item with the prefix "nssl" to our pictures array
                pictures.append(item)
            }
        }
        
        // Print out the content of the pictures array
        print(pictures)
    }
    
    // tableView references the table view inside the method and it is of type UITableView
    // iOS uses numberOfRowsInSection method when it wants to know how many rows are in the table view
    // section is there because table views can be divided into sections
    // The underscore means that a name doesn't have to be sent externally
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    // The method is called cellForRowAt and will be called when you need to provide a row
    // indexPath is the row to show and is of type IndexPath
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // This creates a new constant called cell by deqeuing a recycled cell from the table. When one cell is swiped off screen, iOS takes it, puts it into a reuse queue, and replaces it with a new cell at the bottom of the screen
        // "Picture" is the cell type we want to recycle
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        // Gives the text label of the cell the same text as a picture in our array
        // There might be a text label or there might not be. This line only executes only if there is a text label
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Try loading "Detail" view controller using 'withIdentifier' and typecasting it to DetailViewController using 'as?'
        // If any of the 3 possible things to fail, fails, 'if let' makes it so that the code inside the curly braces don't execute
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // So if it's a success, set its selectedImage property
            vc.selectedImage = pictures[indexPath.row]
            // Now push it into the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    // This method is called when the system is running low on resources
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

