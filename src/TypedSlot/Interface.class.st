Class {
	#name : #Interface,
	#superclass : #Object,
	#instVars : [
		'selectors'
	],
	#category : #'TypedSlot-Core'
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
		ifFalse: [ self error: 'This kind of object can not be stored by the slot. It needs to implement the required interface.' ]
]

{ #category : #comparing }
Interface >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ selectors hash
]

{ #category : #initialization }
Interface >> initialize [
	super initialize.
	self selectors: Set new
]

{ #category : #printing }
Interface >> printOn: aStream [
	self storeOn: aStream
]

{ #category : #accessing }
Interface >> selectors [
	^ selectors
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
	self selectors storeOn: aStream.
	aStream nextPut: $)
]
