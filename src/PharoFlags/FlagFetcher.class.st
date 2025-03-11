"
This class is responsible for generating the URL of a country’s flag image based on its country code.
It provides methods to construct standardized URLs that point to external resources (e.g., Wikimedia or FlagCDN).
"
Class {
	#name : #FlagFetcher,
	#superclass : #Object,
	#category : #PharoFlags
}

{ #category : #'as yet unclassified' }
FlagFetcher class >> flagURLForCountryName: aName [
   ^ 'https://flagsapi.com/', aName asString, '/flat/64.png'

]

{ #category : #'as yet unclassified' }
FlagFetcher >> flagURLForCountryName: aName [
	^ 'https://flagcdn.com/w320/', (aName asLowercase replaceAll: ' ' with: '-') , '.png'

]
