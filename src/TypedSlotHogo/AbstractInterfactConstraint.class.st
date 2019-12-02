"
I represent a interface contraint.
I constraint object that are written in a slot using me to be able to understand my #interface variables.

I can be either Anonymous or Named for now, see my subclasses.

	My #interface variable contains an Interface.
"
Class {
	#name : #AbstractInterfactConstraint,
	#superclass : #AbstractConstraint,
	#instVars : [
		'interface'
	],
	#category : #TypedSlotHogo
}

{ #category : #accessing }
AbstractInterfactConstraint class >> initialSelector [
	^ #understands: 
]

{ #category : #checking }
AbstractInterfactConstraint >> checkConstraint: anObject [
	(anObject class selectors includesAll: interface selectors)
		ifFalse: [ self wasViolatedBy: anObject ]
]

{ #category : #testing }
AbstractInterfactConstraint >> hasSamePropertiesAs: anInterfaceType [
	^ interface = anInterfaceType interface
]

{ #category : #accessing }
AbstractInterfactConstraint >> interface [
	^ interface
]

{ #category : #accessing }
AbstractInterfactConstraint >> interface: anObject [
	interface := anObject
]

{ #category : #testing }
AbstractInterfactConstraint >> isAnonymous [
	^ false
]

{ #category : #testing }
AbstractInterfactConstraint >> isInterfaceType [
	^ true
]
