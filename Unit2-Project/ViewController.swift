//
//  ViewController.swift
//  Unit2-Project
//
//  Created by A Rufin on 1/26/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource 
{
    
    var movies: [Movie] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() 
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Create a URL for the request
        // In this case, the custom search URL you created in in part 1
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=907b58a2543c822ec3fb4b77c785507b")!
       
        // Use the URL to instantiate a request
        let request = URLRequest(url: url)
        //request.httpMethod = "GET"
        
        
        // Create a URLSession using a shared instance and call its dataTask method
        // The data task method attempts to retrieve the contents of a URL based on the specified URL.
        // When finished, it calls it's completion handler (closure) passing in optional values for data (the data we want to fetch), response (info about the response like status code) and error (if the request was unsuccessful)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            // Handle any errors
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }
            
            // Make sure we have data
            guard let data = data else 
            {
                print("❌ Data is nil")
                return
            }
            
            // The `JSONSerialization.jsonObject(with: data)` method is a "throwing" function (meaning it can throw an error) so we wrap it in a `do` `catch`
            // We cast the resultant returned object to a dictionary with a `String` key, `Any` value pair.
            do 
            {
                // Create a JSON Decoder
                let decoder = JSONDecoder()
                
                // Use the JSON decoder to try and map the data to our custom model.
                // TrackResponse.self is a reference to the type itself, tells the decoder what to map to.
                let response = try decoder.decode(MovieResponse.self, from: data)
                
                // Access the array of tracks from the `results` property
                let movies = response.results
                // Execute UI updates on the main thread when calling from a background callback
                DispatchQueue.main.async 
                {
                    
                    // Set the view controller's tracks property as this is the one the table view references
                    self?.movies = movies
                    
                    // Make the table view reload now that we have new data
                    self?.tableView.reloadData()
                }
                
                print("✅ \(movies)")
                
            } catch let DecodingError.dataCorrupted(context) {
                print(context)
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print("error: ", error)
            }
            
            /*{
                print("❌ Error parsing JSON: \(error.localizedDescription)")
            }*/
        }
        
        // Initiate the network request
        task.resume()
        print(movies)
        tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        // Get the track that corresponds to the table view row
        let movie = movies[indexPath.row]
        
        // Configure the cell with it's associated track
        cell.configure(with: movie)
        
        // return the cell for display in the table view
        return cell
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell,
           // Get the index path of the cell from the table view
           let indexPath = tableView.indexPath(for: cell),
           // Get the detail view controller
           let detailViewController = segue.destination as? DetailViewController {
            
            // Use the index path to get the associated track
            let movie = movies[indexPath.row]
            
            // Set the track on the detail view controller
            detailViewController.movie = movie
        }
    }
}
        /*movies = Movie.mockMovies
        print(movies)
        tableView.dataSource = self
        
    }
    
    


    

*/
