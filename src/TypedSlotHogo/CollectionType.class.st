"
I represent a collection type.
	
	Try This!
	creation: #aCollectionTypedIV type: (Array of: Character)
	{ $a. $b } is something that would fit this slot.

    Instance Variables
	My #collectionType contains an abstract type. No limitation for now, but I'm not sure it makes sense to allow anything but a SingleType inside it. Maybe a multipleType, but not a collectionType.
	My #elementType contains an abstract type.


"
Class {
	#name : #CollectionType,
	#superclass : #AbstractType,
	#instVars : [
		'collectionType',
		'elementType'
	],
	#category : #TypedSlotHogo
}

{ #category : #printing }
CollectionType class >> initialSelector [
	^ #type:
]

{ #category : #testing }
CollectionType >> checkObjectType: anObject [
	(anObject isNil 
		or: [ (anObject isKindOf: collectionType type) 
		and: [ anObject do: [:anElement| elementType checkObjectType: anElement ]. true "If we don't get a type violation during the #do:, all element comply." ] ] ) 
		ifFalse: [ self typeViolationWith: anObject ]
]

{ #category : #accessing }
CollectionType >> collectionType [
	^ collectionType
]

{ #category : #accessing }
CollectionType >> collectionType: aType [
	"Does it make sense to have a check that this is a singleType? Can a CollectionType have a collectionType as collection type? (maybe change that iv name though...)"
	collectionType := aType
]

{ #category : #printing }
CollectionType >> definitionStringOn: aStream [
	aStream << '('.
	collectionType definitionStringOn: aStream.
	aStream << ' of: '.
	elementType definitionStringOn: aStream.
	aStream << ')'
]

{ #category : #accessing }
CollectionType >> elementType [
	^ elementType
]

{ #category : #accessing }
CollectionType >> elementType: aType [
	elementType := aType
]

{ #category : #comparing }
CollectionType >> hasSameTypeAs: anotherType [
	^ collectionType = anotherType collectionType and:[ elementType = anotherType elementType ]
]

{ #category : #testing }
CollectionType >> isCollectionType [
	^ true
]

{ #category : #printing }
CollectionType >> printOn: aStream [
	aStream print: self class;
		<< '(';
		print: collectionType ;
		<< ' of: ';
		print: elementType;
		<< ')'
]
