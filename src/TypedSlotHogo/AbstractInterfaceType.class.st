Class {
	#name : #AbstractInterfaceType,
	#superclass : #AbstractType,
	#instVars : [
		'interface'
	],
	#category : #TypedSlotHogo
}

{ #category : #accessing }
AbstractInterfaceType class >> initialSelector [
	^ #understands: 
]

{ #category : #checking }
AbstractInterfaceType >> checkObjectType: anObject [
	(anObject class selectors includesAll: interface selectors)
		ifFalse: [ self typeViolationWith: anObject ]
]

{ #category : #testing }
AbstractInterfaceType >> hasSameTypeAs: anInterfaceType [
	^ interface = anInterfaceType interface
]

{ #category : #accessing }
AbstractInterfaceType >> interface [
	^ interface
]

{ #category : #accessing }
AbstractInterfaceType >> interface: anObject [
	interface := anObject
]

{ #category : #testing }
AbstractInterfaceType >> isAnonymous [
	^ false
]

{ #category : #testing }
AbstractInterfaceType >> isInterfaceType [
	^ true
]
