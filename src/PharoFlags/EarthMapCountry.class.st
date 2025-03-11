"
This class models a country as it appears on the world map.
Each instance contains attributes like the country name, SVG shape path, code, and associated data needed for visualization and interaction.
"
Class {
	#name : #EarthMapCountry,
	#superclass : #Object,
	#instVars : [
		'svgPath',
		'attributes',
		'name',
		'code'
	],
	#category : #PharoFlags
}

{ #category : #visualization }
EarthMapCountry >> asRSShape [
   | shape |
   shape := RSSVGPath new.
   shape svgPath: self svgPath.
   shape color: Color random.
   ^ shape.

]

{ #category : #attributes }
EarthMapCountry >> attributes [
    ^ attributes
]

{ #category : #attributes }
EarthMapCountry >> attributes: aDict [
	attributes := aDict
]

{ #category : #accessing }
EarthMapCountry >> code [
   ^ code
]

{ #category : #accessing }
EarthMapCountry >> code: aString [
   code := aString
]

{ #category : #test }
EarthMapCountry >> demoShape [
   self svgPath: 'M 100 100 L 300 100 L 300 300 L 100 300 Z'.
   ^ self asRSShape

]

{ #category : #initialization }
EarthMapCountry >> fromXML: aXMLElement [
  | path title id |
  path := aXMLElement attributeAt: 'd'.
  title := aXMLElement attributeAt: 'title'.
  id := aXMLElement attributeAt: 'id'.
  self svgPath: path.
  self name: title.
  self code: id.
  ^ self

]

{ #category : #getAttribute }
EarthMapCountry >> getAttribute: aKey [
    ^ attributes at: aKey ifAbsent: [ nil ]
]

{ #category : #accessing }
EarthMapCountry >> name [
   ^ name
]

{ #category : #accessing }
EarthMapCountry >> name: aString [
   name := aString
]

{ #category : #accessing }
EarthMapCountry >> svgPath [
   ^ svgPath
]

{ #category : #accessing }
EarthMapCountry >> svgPath: aString [
   svgPath := aString
]
