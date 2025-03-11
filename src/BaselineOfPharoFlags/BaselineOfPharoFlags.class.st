"
This class defines the baseline (configuration) for the PharoFlags project using Metacello.
It declares the required packages, dependencies, and loadable components for the project.

"
Class {
	#name : #BaselineOfPharoFlags,
	#superclass : #Object,
	#category : #BaselineOfPharoFlags
}

{ #category : #baselines }
BaselineOfPharoFlags >> baseline: spec [
	<baseline>
	spec
		for: #common do: [
			spec packages: #('PharoFlags') ].

]
