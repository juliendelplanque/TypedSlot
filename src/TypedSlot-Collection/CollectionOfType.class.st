Class {
	#name : #CollectionOfType,
	#superclass : #Object,
	#instVars : [
		'collectionType',
		'itemsType'
	],
	#category : #'TypedSlot-Collection'
}

{ #category : #comparing }
CollectionOfType >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ collectionType = anObject collectionType
		and: [ itemsType = anObject itemsType ]
]

{ #category : #checking }
CollectionOfType >> checkObjectType: anObject [
	[
		self collectionType checkObjectType: anObject.
	
		anObject do: [ :item |
			self itemsType checkObjectType: item ]
	] on: TypeViolation do: [ 
		(TypeViolation expectedType: self objectAttemptedToBeWritten: anObject) signal ]
]

{ #category : #accessing }
CollectionOfType >> collectionType [
	^ collectionType
]

{ #category : #accessing }
CollectionOfType >> collectionType: anObject [
	collectionType := anObject
]

{ #category : #comparing }
CollectionOfType >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ collectionType hash bitXor: itemsType hash
]

{ #category : #accessing }
CollectionOfType >> itemsType [
	^ itemsType
]

{ #category : #accessing }
CollectionOfType >> itemsType: anObject [
	itemsType := anObject
]

{ #category : #printing }
CollectionOfType >> printOn: aStream [
	self storeOn: aStream
]

{ #category : #printing }
CollectionOfType >> storeOn: aStream [
	aStream nextPut: $(.
	aStream nextPutAll: self className.
	aStream nextPutAll: ' withItemsType: '.
	self itemsType storeOn: aStream.
	aStream nextPut: $)
]
