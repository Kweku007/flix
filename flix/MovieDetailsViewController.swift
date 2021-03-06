//
//  MovieDetailsViewController.swift
//  flix
//
//  Created by Kweku Aboagye on 9/30/20.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {
    
    
    @IBOutlet var backdropView: UIImageView!
    
    @IBOutlet var posterView: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var synopsisLabel: UILabel!
    
    var movie: [String: Any]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        
        synopsisLabel.text = movie["overview"] as? String
        synopsisLabel.sizeToFit()
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string : baseUrl + posterPath)
        
        posterView.af.setImage(withURL: posterUrl!)
        posterView.isUserInteractionEnabled = true
        
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string : "https://image.tmdb.org/t/p/w780" + backdropPath)
        
        backdropView.af.setImage(withURL: backdropUrl!)
        
    
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        
        // Pass selected movie to details view controller
        let moviedetailsViewController = segue.destination as! WebViewController
        moviedetailsViewController.movie = movie

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
