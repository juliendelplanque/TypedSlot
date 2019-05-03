Class {
	#name : #Interface,
	#superclass : #Object,
	#instVars : [
		'selectors'
	],
	#category : #'TypedSlot-Core'
}

{ #category : #adding }
Interface >> addSelector: aSymbol [
	selectors add: aSymbol
]

{ #category : #checking }
Interface >> checkObjectType: anObject [
	(anObject class selectors includesAll: self selectors)
		ifFalse: [ self error: 'This kind of object can not be stored by the slot. It needs to implement the required interface.' ]
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
	aStream nextPutAll: self className.
	aStream nextPut: Character space.
	aStream nextPutAll: 'selectors: '.
	self selectors asArray storeOn: aStream.
]
