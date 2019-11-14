"
I represent a interface contraint.
I constraint object that are written in a slot using me to be able to understand my #interface variables.

I can be either Anonymous or Named for now, see my subclasses.

	My #interface variable contains an Interface.
"
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
