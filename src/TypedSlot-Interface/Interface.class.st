"
An interface:
- declares only method selectors
- cannot be instantiated.
- can be used to type a TypedSlot
- can extend several other interfaces.
"
Class {
	#name : #Interface,
	#superclass : #Object,
	#instVars : [
		'selectors',
		'extendedInterfaces'
	],
	#category : #'TypedSlot-Interface'
}

{ #category : #accessing }
Interface class >> selectors: aCollectionOfSymbols [
	^ self new
		selectors: aCollectionOfSymbols;
		yourself
]

{ #category : #comparing }
Interface >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ selectors = anObject selectors
]

{ #category : #adding }
Interface >> addSelector: aSymbol [
	selectors add: aSymbol
]

{ #category : #checking }
Interface >> checkObjectType: anObject [
	(anObject class selectors includesAll: self selectors)
		ifFalse: [ (TypeViolation expectedType: self objectAttemptedToBeWritten: anObject) signal ]
]

{ #category : #accessing }
Interface >> extendedInterfaces [
	^ extendedInterfaces
]

{ #category : #accessing }
Interface >> extendedInterfaces: aCollectionOfInterfaces [
	| allSelectors |
	allSelectors := selectors , (aCollectionOfInterfaces flatCollect: #selectors).
	allSelectors size = allSelectors asSet size
		ifFalse: [ InterfacesConflict signal ].
	
	extendedInterfaces := aCollectionOfInterfaces
]

{ #category : #testing }
Interface >> hasFullControlOnDefinitionString [
	^ true
]

{ #category : #comparing }
Interface >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ selectors hash
]

{ #category : #initialization }
Interface >> initialize [
	super initialize.
	self selectors: Set new.
	self extendedInterfaces: #()
]

{ #category : #printing }
Interface >> printOn: aStream [
	self storeOn: aStream
]

{ #category : #accessing }
Interface >> selectors [
	^ selectors , (self extendedInterfaces flatCollect: #selectors)
]

{ #category : #accessing }
Interface >> selectors: anObject [
	selectors := anObject asOrderedCollection
]

{ #category : #printing }
Interface >> storeOn: aStream [
	aStream nextPut: $(.
	aStream nextPutAll: self className.
	aStream nextPut: Character space.
	aStream nextPutAll: 'selectors: '.
	self selectors asArray storeOn: aStream.
	aStream nextPut: $)
]
