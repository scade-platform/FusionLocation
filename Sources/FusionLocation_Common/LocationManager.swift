import Foundation

public enum LocationUsage {
    case always
    case whenInUse
}

public protocol LocationManagerProtocol {
    /*
     *  Creates and returns a new LocationManager object initialized with the LocationUsage.
     *  
     *  Parameters:  usage  It targets only for iOS
     *                      It is used when call requestAuthorization.
     *                      If always, it calls requestAlwaysAuthorization. If whenInUse, it calls requestWhenInUseAuthorization.
     */
    init(usage: LocationUsage)

    /*
     * @property requestAuthorization
     *
     * @discussion Request a authorization.
     *	           Calling. this method will trigger a prompt to request usage
     *             authorization from the user.
     */  
    func requestAuthorization()
    
    /*
     * @property requestCurrentLocation
     *
     * @discussion Request a single location update.
     *             The service will attempt to determine location. The location update will be delivered
     *             via the receiver
     *				
     *             If no location can be determined, the receiver will be delivered with location nil.
     *				
     *             There can only be one outstanding location request and this method can
     *             not be used concurrently with startUpdatingLocation  Calling either of those methods will
     *             immediately cancel the location request.  The method
     *             topUpdatingLocation can be used to explicitly cancel the request.
     */
    func requestCurrentLocation(receiver: @escaping (Location?) -> Void)
    
    /*
     * @property startUpdatingLocation
     *
     * @discussion Start updating locations.
     *             The service will attempt to determine location. The location update will be delivered
     *             via the receiver
     *				
     *             If no location can be determined, the receiver will be delivered with location nil.
     */
    func startUpdatingLocation(receiver: @escaping (Location?) -> Void)

    /*
     * @property stopUpdatingLocation
     *
     * @discussion Stop updating locations.
     */
    func stopUpdatingLocation()

    /*
     * @property distanceBetween
     *
     * @discussion Calculate the distance of two locations.
     *
     * @param location1  from location.
     *        location2  to location
     *
     * @result 	meter distance
     */
    func distanceBetween(from location1: Location, to location2: Location) -> Double

    /*
     * @property bearingBetween
     *
     * @discussion Calculate the bearing of two locations.
     *
     * @param location1  from location.
     *        location2  to location
     *
     * @result degree
     */
    func bearingBetween(from location1: Location, to location2: Location) -> Double
}
