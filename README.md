# CountryFlag Exercise (Pharo 11)

## Description  
This exercise consists of building a visual application using **Pharo 11**.  
The goal is to visualize countries on a world map and associate each country with its corresponding national flag.

## Technologies Used
- **Pharo 11**
- **Roassal3** : For rendering the world map
- **XMLParser** : For parsing SVG files and extracting countries
- **Spec UI** : For creating user interfaces
- **SUnit** : For unit testing
- **Git / Iceberg** : For version control


## Project Structure

### ▶ Package: `PharoFlags`
-  EarthMap: Loads and visualizes country shapes on the map.
-  EarthMapCountry: Represents a country entity with attributes (e.g., `code`, `name`).
-  FlagFetcher: Generates the URL to fetch a country's flag.
-  EarthPlayground: Visualization environment to display the countries and flags.

### ▶ Package: `BaselineOfPharoFlags`
- Defines the baseline and dependencies of the project.


## Testing
All unit tests were executed successfully using **SUnit** with **100% success (48/48 tests passed)**.


### Sample test case
  smalltalk
testFlagURLGeneration
  | url |
  url := FlagFetcher flagURLForCountryName: 'Germany'.
  self assert: (url asLowercase includesSubstring: 'germany/flat').
