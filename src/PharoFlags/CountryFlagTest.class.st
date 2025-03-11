Class {
	#name : #CountryFlagTest,
	#superclass : #TestCase,
	#category : #'PharoFlags-Tests'
}

{ #category : #tests }
CountryFlagTest >> testCountriesAreEarthMapCountryInstances [
	| map |
	map := EarthMap new.
	map loadCountriesFromSVG: 'C:/Users/Utilisateur/Documents/Pharo/images/Pharo 11.0 - 64bit (old stable)/world.svg'.
	self assert: (map countries allSatisfy: [:c | c isKindOf: EarthMapCountry]).

]

{ #category : #tests }
CountryFlagTest >> testCountryAsRSShape [
	| country shape |
	country := EarthMapCountry new.
	country svgPath: 'M10 10 L20 20'.
	shape := country asRSShape.
	self assert: (shape isKindOf: RSShape).
]

{ #category : #tests }
CountryFlagTest >> testCountryAttributes [
	| countryAttributes |
	countryAttributes := Dictionary new.
	countryAttributes at: #title put: 'Germany'.
	self assert: (countryAttributes at: #title) = 'Germany'.

]

{ #category : #tests }
CountryFlagTest >> testFlagURLGeneration [
	| url |
	url := FlagFetcher flagURLForCountryName: 'Germany'.
	self assert: (url asLowercase includesSubstring: 'germany/flat').

]

{ #category : #tests }
CountryFlagTest >> testLabelWithTooltip [
	| flagURL |
	flagURL := FlagFetcher flagURLForCountryName: 'France'.
	self assert: (flagURL asLowercase includesSubstring: 'france/flat').


]

{ #category : #tests }
CountryFlagTest >> testLoadCountriesFromSVG [
	| map |
	map := EarthMap new.
	map loadCountriesFromSVG: 'C:/Users/Utilisateur/Documents/Pharo/images/Pharo 11.0 - 64bit (old stable)/world.svg'.
	self assert: map countries notEmpty.
]
