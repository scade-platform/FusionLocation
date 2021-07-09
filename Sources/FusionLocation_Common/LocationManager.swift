import Foundation

public enum LocationUsage {
    case always
    case whenInUse
}

public protocol LocationManagerProtocol {
    /*     *  Creates and returns a new LocationManager object initialized with the LocationUsage.     *       *  Parameters:  usage    	It targets only for iOS. 
     *							It is used when call requestAuthorization.
     * 							If always, it calls requestAlwaysAuthorization. If whenInUse, it calls requestWhenInUseAuthorization.     */
    init(usage: LocationUsage)

    /*     *  requestAuthorization     *     *  Discussion:     *      Request a authorization.     *     *      Calling this method will trigger a prompt to request usage     *      authorization from the user.
     */
    func requestAuthorization()
    
    /*     *  requestCurrentLocation     *     *  Discussion:     *      Request a single location update.     *     *      The service will attempt to determine location. The location update will be delivered     *      via the receiver     *     *      If no location can be determined, the receiver will be delivered with location nil.     *     *      There can only be one outstanding location request and this method can     *      not be used concurrently with startUpdatingLocation  Calling either of those methods will     *      immediately cancel the location request.  The method     *      stopUpdatingLocation can be used to explicitly cancel the request.     */    
    func requestCurrentLocation(receiver: @escaping (Location?) -> Void)
    
    /*     *  startUpdatingLocation     *       *  Discussion:     *      Start updating locations.
     *      The service will attempt to determine location. The location update will be delivered     *      via the receiver     *     *      If no location can be determined, the receiver will be delivered with location nil.     */    
    func startUpdatingLocation(receiver: @escaping (Location?) -> Void)
    
    /*     *  stopUpdatingLocation     *       *  Discussion:     *      Stop updating locations.     */    
    func stopUpdatingLocation()
    
    /*     *  distanceBetween     *  
     *  Parameters:  location1  from location
     *				 location2  to location
     *
     *  Return Value: meter distance
     *				      *  Discussion:     *      Calculate the distance of two locations.     */        
    func distanceBetween(from location1: Location, to location2: Location) -> Double
    
     /*     *  bearingBetween     *  
     *  Parameters:  location1  from location
     *				 location2  to location
     *
     *  Return Value: degree
     *				      *  Discussion:     *      Calculate the bearing of two locations.     */    
    func bearingBetween(from location1: Location, to location2: Location) -> Double
}
