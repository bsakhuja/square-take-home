## Build tools & versions used
* Xcode 14.0 (14A309)
* Built and tested on iOS 16 simulator on M2 Macbook Air (2022) running macOS Ventura 13.0

## Steps to run the app
1. Download the code or clone the repository to your machine.
2. Open `EmployeeDirectory.xcodeproj`
3. Build and run the app in the simulator of your choice. The code was developed and tested for iPhone. You can run on an iPad but may run into unexpected behavior.
4. By defualt, the app is hitting the valid employee list endpoint. To test against the malformed or empty responses, open `NetworkingManager.swift` and change the URL in the guard statement in `getEmployees()` to either `malformedURL` or `emptyURL`. For example:

Change the following code
```
guard let url = URL(string: endpointURL) else {
            print("Invalid URL")
            return nil
        }
```
to

```
guard let url = URL(string: malformedURL) else {
            print("Invalid URL")
            return nil
        }
```
## What areas of the app did you focus on?
I spent a good amount of my time trying to make the UI modular extracting code out to their own files like `EmployeeList` and `EmployeeCell`.

I also dedicated some time to adding comments throughout the code.

## What was the reason for your focus? What problems were you trying to solve?
For the UI modularization, I didn't want `ContentView` to be cluttered. I wanted it to be clear to the reader what exactly was hapening.

For commenting, I had a similar objective with the UI modularization. I wanted anyone who looked at the code to have an easy time making sense of it.

## How long did you spend on this project?
Broke this project into multiple parts over the course of a couple days. The breakdown was as follows:
1. Networking and parsing JSON into models
2. Displaying the fetched model data as a list
3. Polishing code and adding unit tests

Overall, I spent roughly five hours.

## Did you make any trade-offs for this project? What would you have done differently with more time?
I would have extracted some of the employee details to a separate detail view. However, as per the instructions, I held off on adding additional screens. Putting all of the employee's information in the list looks somewhat cluttered.

I also would have spent more time handling error/empty states better. The app as it is right now just shows some text in those cases. More descriptive/useful errors would be useful.

Additionally, I would have spent more time on the networking layer. Specifically, I would have introduced more separation of concerns and made the `NetworkingManager` more "dumb" by creating a generic `getData(from URL)` function. This would remove specific "employee" logic from the Networking layer. I would have put the call to the networking layer in an `EmployeeListManager`, for example.

I would have also added some kind of loading indicator when network requests are in progress. Currently, there's no indication to the user when the device is fetching data.

## What do you think is the weakest part of your project?
I think the networking layer could use some polishing.

## Did you copy any code or dependencies? Please make sure to attribute them here!
* [CachedAsyncImage](https://github.com/lorenzofiamingo/swiftui-cached-async-image). Uses SwiftUI's AsyncImage API under the hood with some additional caching capabilities, which made it useful for this project.

## Is there any other information you’d like us to know?
I used SwiftUI in this app. I don't normally use it in my day-to-day but this was a fun exercise.