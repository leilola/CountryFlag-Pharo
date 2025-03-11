"
This class represents the world map and manages the collection of countries to be displayed.
It is responsible for loading, storing, and providing access to the list of EarthMapCountry instances parsed from the SVG file.

"
Class {
	#name : #EarthMap,
	#superclass : #Object,
	#instVars : [
		'countries'
	],
	#category : #PharoFlags
}

{ #category : #visualization }
EarthMap >> asRSCanvas [
   | canvas |
   canvas := RSCanvas new.
   self countries do: [:c |
       (c notNil and: [c svgPath notNil]) ifTrue: [
           canvas addShape: c asRSShape ]].
   ^ canvas

]

{ #category : #accessing }
EarthMap >> countries [
   ^ countries
]

{ #category : #accessing }
EarthMap >> countries: aCollection [
   countries := aCollection
]

{ #category : #initialization }
EarthMap >> loadCountriesFromSVG [
   | xmlDoc countryNodes validCountries |

   xmlDoc := (XMLDOMParser parse: ('world.svg' asFileReference readStream contents)) document.
   countryNodes := xmlDoc nodes first nodes select: [:n | 
       (n isKindOf: XMLElement) and: [n name = 'path' and: [(n attributes includesKey: 'd')]]].

   validCountries := countryNodes collect: [:n | 
       | country |
       country := EarthMapCountry new fromXML: n.
       country ifNotNil: [country]].

   self countries: validCountries

]

{ #category : #initialization }
EarthMap >> loadCountriesFromSVG: aFilePath [
    | xmlDoc countryNodes validCountries |
    
    xmlDoc := (XMLDOMParser parse: (aFilePath asFileReference readStream contents)).
    
    countryNodes := xmlDoc nodes first nodes select: [:n |
        (n isKindOf: XMLElement)
        and: [ (n name = 'path') and: [ n attributes includesKey: 'd' ] ] ].
        
    validCountries := countryNodes collect: [:each |
        EarthMapCountry new
            svgPath: (each attributeAt: 'd');
            attributes: each attributes;
            yourself ].
            
    countries := validCountries.

]
