"
This class is a temporary UI or test environment to interactively test and visualize EarthMap and its countries.
It can be used to simulate map rendering, flag display, and country tooltips before integrating everything into a final application UI.
"
Class {
	#name : #EarthPlayground,
	#superclass : #Object,
	#category : #PharoFlags
}

{ #category : #demo }
EarthPlayground >> drawBoxesDemo [
    | c blueBox redBox |
    c := RSCanvas new.

    blueBox := RSBox new
        size: 80;
        color: Color blue.

    redBox := RSBox new
        size: 80;
        color: Color red.

    c add: blueBox.
    c add: redBox.

    blueBox translateBy: 40 @ 20.

    (c @ RSCanvasController) open.

]

{ #category : #demo }
EarthPlayground >> drawFirstValidCountryFromSVG [
   | xmlDoc allPaths firstValidPath country c |

   xmlDoc := (XMLDOMParser parse: ('world.svg' asFileReference readStream contents)) document.

   allPaths := xmlDoc nodes first nodes select: [:n | 
       (n isKindOf: XMLElement) and: [(n attributes includesKey: 'd')]].

   allPaths isEmpty ifTrue: [^ Transcript show: 'No valid country found in the SVG file'; cr].

   firstValidPath := allPaths first.
   country := EarthMapCountry new fromXML: firstValidPath.
   country ifNil: [^ Transcript show: 'The country could not be generated'; cr].

   c := RSCanvas new.
   c addShape: country asRSShape.
   (c @ RSCanvasController) open.

]

{ #category : #demo }
EarthPlayground >> drawRealCountryFromSVG [
   | xmlDoc firstCountry country c |
   
   xmlDoc := (XMLDOMParser parse: ('world.svg' asFileReference readStream contents)) document.
   firstCountry := xmlDoc nodes first nodes second. 
   
   country := EarthMapCountry new fromXML: firstCountry.

   c := RSCanvas new.
   c addShape: country asRSShape.
   (c @ RSCanvasController) open.

]

{ #category : #demo }
EarthPlayground >> drawSampleCountryShape [
    | c svg |
    c := RSCanvas new.

    svg := RSSVGPath new
        svgPath: 'M 100 350 q 150 -300 300 0';
        color: Color green.

    c addShape: svg.
    (c @ RSCanvasController) open.

]

{ #category : #demo }
EarthPlayground >> loadFirstCountryFromSVG [
   | xmlDoc firstCountry country c |
   
   xmlDoc := (XMLDOMParser parse: ('world.svg' asFileReference readStream contents)) document.
   firstCountry := xmlDoc nodes first nodes second. 
   
   country := EarthMapCountry new fromXML: firstCountry.

   c := RSCanvas new.
   c addShape: country asRSShape.
   (c @ RSCanvasController) open.

]
